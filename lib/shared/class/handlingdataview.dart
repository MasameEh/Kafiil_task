import 'package:flutter/material.dart';
import 'package:kafil/shared/class/statusrequest.dart';
import 'package:lottie/lottie.dart';

class HandlingDataReq extends StatelessWidget {
  final StatusRequest? statusRequest;
  final Widget widget;

  const HandlingDataReq(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset("assets/offline.json",
                    width: 250, height: 250))
            : widget;
  }
}

// class HandlingDataView extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//   const HandlingDataView(
//       {super.key, required this.statusRequest, required this.widget});
//
//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ?   Center(child: Lottie.asset(AppImageAsset.loading , width: 250 , height: 250))
//         : statusRequest == StatusRequest.offlineFailure
//         ? Center(child: Lottie.asset(AppImageAsset.offline , width: 250 , height: 250))
//         : statusRequest == StatusRequest.serverFailure
//         ?Center(child: Lottie.asset(AppImageAsset.server , width: 250 , height: 250))
//         : statusRequest == StatusRequest.failure
//         ? Center(child: Lottie.asset(AppImageAsset.noData , width: 250 , height: 250 , repeat: true  ))
//         : widget;
//   }
// }
