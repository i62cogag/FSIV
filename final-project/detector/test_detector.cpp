//! \file test_detector.cpp
//! \author FSIV

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/ml/ml.hpp>
#include <opencv2/dnn.hpp>
#include "common_code.hpp"
#include "lbp.h"

using namespace std;
using namespace cv::ml;

#define MAX_DETS_PER_IMAGE 20

const cv::String keys =
    "{help h usage ? |      | print this message   }"
    "{model m        |model_svm.yml| path to model file.  }"
    "{stride s       |25     | Stride value. Default 2.}"
    "{thrdet t       |0     | Detection threshold. Default 0.}"
    "{levels l       |3     | Number of levels of pyramid search. Def. 3}"
    "{factor f       |0.5   | Scale factor for pyramid. Def. 0.5}"
    "{iou_th         |0.5   | IoU threshold. Def. 0.5}"
    "{@test_dataset  |<none>| file with test images.}"
    ;

int
main(int argc, char * argv[])
{
    cv::CommandLineParser parser(argc, argv, keys);
    parser.about("Detects objects with a LBP-based detector.");
    if (parser.has("help"))
    {
        parser.printMessage();
        return 0;
    }

    // Setting parameters.
    int winsize[] = {128, 64};
    int stride = parser.get<int>("stride");
    float thr_det = parser.get<float>("thrdet");
    int nlevels = parser.get<int>("levels");
    float factor = parser.get<float>("factor");
    float iou_th = parser.get<float>("iou_th");


     // TODO
	  // Split image into cells to compute LBP full descriptor
	  // You must adapt this regarding your training stage.
     int ncells[] = {6,4}; // Rows x cols // 6x4
     //

    string clf_model_file = parser.get<string>("model");
	 cv::Ptr<SVM> svm;

    //TODO: Load de classifier model.
    svm = cv::Algorithm::load<SVM>(clf_model_file);
	std::cout << "+ Model loaded from: " << clf_model_file << std::endl;
    std::cout << "Descriptor dimension: " << svm->getVarCount() << std::endl;
    //


    std:fstream dataset (parser.get<cv::String>(0));
    if (! dataset)
    {
        std::cerr << "Error: could not open dataset filename '" <<
                     parser.get<cv::String>(0) << "'." << std::endl;
        return -1;
    }

    //Stats variables to compute performance metrics.
    float num_imgs = 0.0;
    float t_total = 0.0;
    float tp_total = 0.0;
    float fp_total = 0.0;

    // Loop on dataset images, annotations
    while(dataset && !dataset.eof())
    {
        std::string image_file;
        std::string annotations_file;

        dataset >> image_file >> annotations_file;

        if (!dataset || dataset.eof())
            continue;

        // Load image
        cv::Mat image_orig = cv::imread(image_file);
        if (image_orig.empty())
        {
            std::cerr << "Error: could not open image '"<< parser.get<cv::String>(0) << "'." << std::endl;
            return -1;
        }
        cv::Mat image;
        cv::cvtColor(image_orig, image, cv::COLOR_BGR2GRAY);

        int nrows = image.rows;
        int ncols = image.cols;

        //Load annotations.
        std::vector<cv::Rect> annotated_boxes;
        annotated_boxes.resize(0);
        if (! read_INRIA_annotations(annotations_file, annotated_boxes))
        {
            std::cerr << "Error: could not parser annotations file '"
                      << annotations_file << "'." << std::endl;
            return -1;
        }

        /// Run multi-scale detector
        std::vector<cv::Rect> lRs;
        lRs.resize(0);
        std::vector<float> lscores;
        lscores.resize(0);

        std::cout << "Processing image: '" << image_file <<"'." << std::endl;

        //TODO: You must implement this function (the detector) in the lbp module (lbp.h/lbp.cpp).
        fsiv_detect_pyr(image, svm, winsize, stride, ncells, nlevels, factor, thr_det, lRs, lscores);
        //

        std::cout << "done!" << std::endl;

        // NMS
        std::vector<int> indices;
        indices.resize(0);
        float nmsThreshold = 0.4;

        //TODO: you must process the detected list of bb to non-maxima-supression.
        // see: https://docs.opencv.org/3.4/d6/d0f/group__dnn.html#ga9d118d70a1659af729d01b10233213ee
        cv::dnn::NMSBoxes(lRs,lscores,thr_det,nmsThreshold,indices);

        //

        std::vector<cv::Rect> detections;
        detections.resize(0);
        for (int i = 0; i < MIN(indices.size(), MAX_DETS_PER_IMAGE); i++)
        {
            std::cout << lRs[indices[i]] << " " << lscores[indices[i]] << std::endl;
            detections.push_back(lRs[indices[i]]);
        }

        // Draw annotations.

        for (int i = 0; i < annotated_boxes.size(); i++)
        {
            //TODO: draw a rectangle on image_orig with the annotated bb with green color.
            //Use 3 for thickness value.
            cv::rectangle(image_orig,annotated_boxes[i],cv::Scalar(0,255,0),3);
				//
        }

        // Draw detections
        int random_colour_b = 0;
        int random_colour_r = 0;
        for (int i = 0; i < detections.size(); i++)
        {
            //TODO: draw a rectangle on image_orig with the detected bb with color other than green.
            //Use 3 for thickness value.
            //Use random colors to differentiate between detected windows.
            random_colour_b = rand()%254;
            random_colour_r = rand()%254;
            cv::rectangle(image_orig,detections[i],cv::Scalar(random_colour_b,0,random_colour_r),3);
				//
        }

        int tp, fp;
        compute_tp_fp(annotated_boxes, detections, iou_th, tp, fp);
        std::cout << "#ann: " << annotated_boxes.size() << " tp: " << tp << " fp: " << fp << std::endl;
        t_total += annotated_boxes.size();
        tp_total += tp;
        fp_total += fp;
        num_imgs += 1.0;
        cv::imshow("Detection", image_orig);
        cv::waitKey(-1);
    }

    std::cout << "\t\t### SUMMARY ####" << std::endl;
    std::cout << "#images     : " << num_imgs << std::endl;
    std::cout << "#annotations: " << t_total << std::endl;
    std::cout << "tp          : " << tp_total << std::endl;
    std::cout << "fp          : " << fp_total << std::endl;
    std::cout << "%deteccion  : " << tp_total/t_total << std::endl;
    std::cout << "FPPI        : " << fp_total/num_imgs << std::endl;

   return 0;
}
