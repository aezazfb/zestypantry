// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Requests {
//   String? requestID;
//   DateTime? requestDateTime;
//   String? deliveryDateTime;
//   String? requestStatus;
//   int? requestAmount;
//   bool? isFirstRequest;
//   String? requestDetails;
//   List? customerDetails;
//   String? address;
//   int? sellerID;
//   String? consumerContact;
//   String? requestType;
//   String? discountDetails;
//   String? riderDetails;
//   bool? discounted;
//
//   Requests(
//       {this.requestID,
//       this.requestDateTime,
//       this.deliveryDateTime,
//       this.requestStatus,
//       this.requestAmount,
//       this.isFirstRequest,
//       this.requestDetails,
//       this.customerDetails,
//       this.address,
//       this.sellerID,
//       this.consumerContact,
//       this.requestType,
//       this.discountDetails,
//       this.riderDetails,
//       this.discounted
//       });
//
//   Requests.fromJson(Map<String, dynamic> json) {
//     requestID = json['requestID'];
//     requestDateTime = json['requestDateTime'];
//     deliveryDateTime = json['deliveryDateTime'];
//     requestStatus = json['requestStatus'];
//     requestAmount = json['requestAmount'];
//     isFirstRequest = json['isFirstRequest'];
//     requestDetails = json['requestDetails'];
//     customerDetails = json['customerDetails'];
//     address = json['address'];
//     sellerID = json['sellerID'];
//     consumerContact = json['consumerContact'];
//     requestType = json['requestType'];
//     discountDetails = json['discountDetails'];
//     riderDetails = json['riderDetails'];
//     discounted = json['discounted'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['requestID'] = requestID;
//     data['requestDateTime'] = requestDateTime;
//     data['deliveryDateTime'] = deliveryDateTime;
//     data['requestStatus'] = requestStatus;
//     data['requestAmount'] = requestAmount;
//     data['isFirstRequest'] = isFirstRequest;
//     data['requestDetails'] = requestDetails;
//     data['customerDetails'] = customerDetails;
//     data['address'] = address;
//     data['sellerID'] = sellerID;
//     data['consumerContact'] = consumerContact;
//     data['requestType'] = requestType;
//     data['discountDetails'] = discountDetails;
//     data['riderDetails'] = riderDetails;
//     data['discounted'] = discounted;
//     return data;
//   }
//
//   Requests.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
//       : requestID          = doc.id,
//         requestDateTime    = doc.data()!["requestDateTime"],
//         deliveryDateTime   = doc.data()!["deliveryDateTime"],
//         requestStatus      = doc.data()!["requestStatus"],
//         requestAmount      = doc.data()!["requestAmount"],
//         isFirstRequest     = doc.data()!["isFirstRequest"],
//         requestDetails     = doc.data()!["requestDetails"],
//         customerDetails     = doc.data()!["customerDetails"],
//         address            = doc.data()!["address"],
//         sellerID           = doc.data()!["sellerID"],
//         consumerContact    = doc.data()!["consumerContact"],
//         requestType        = doc.data()!["requestType"],
//         discountDetails    = doc.data()?["discountDetails"],
//         riderDetails       = doc.data()?["riderDetails"],
//         discounted         = doc.data()?["discounted"];
//
// }
