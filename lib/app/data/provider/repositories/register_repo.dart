import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/app_constants.dart';
import '../../services/dio_service.dart';
import '../responses/register_response.dart';

class RegisterRepo {

  final DioService dioService;
  final GetStorage _storage = GetStorage();

  RegisterRepo({required this.dioService});

  Future<Response> register({required dynamic data}) async {
    return await dioService.postData('/register', data: data);
  }

  Future<Response> sendOTP({required dynamic data}) async {
    return await dioService.postData('/otp', data: data);
  }

  Future<Response> update_profile({required dynamic data}) async {
    return await dioService.postData('/update_profile', data: data);
  }

  Future<Response> saveProduit({required dynamic data}) async {
    return await dioService.postData('/produit', data: data);
  }
  Future<Response> updateProduit({required dynamic data}) async {
    return await dioService.postData('/update_produit', data: data);
  }
  Future<Response> deletePhoto({required dynamic data}) async {
    return await dioService.postData('/delete_photo', data: data);
  }

  Future<Response> saveClient({required dynamic data}) async {
    return await dioService.postData('/client', data: data);
  }

  Future<Response> saveFacture({required dynamic data}) async {
    return await dioService.postData('/facture', data: data);
  }

  Future<Response> updateStatutFacture({required dynamic data}) async {
    return await dioService.postData('/update_statut_facture', data: data);
  }


  Future sessionDataSave(RegisterResponse registerResponse) async {
    _storage.write(AppConstants.USER_ID, registerResponse.data?.id);
    _storage.write(AppConstants.USER_FIRSTNAME, registerResponse.data?.firstname);
    _storage.write(AppConstants.USER_LASTNAME, registerResponse.data?.lastname);
    _storage.write(AppConstants.USER_EMAIL, registerResponse.data?.email);
    print('@@@@@@@@@@@@@@@@@@RegisterResponse@@@@@@@@@@@');
    print(registerResponse.data?.firstname);
    print(registerResponse.data?.email);
  }

  Future<Response> payerTicket({required dynamic data}) async {
    return await dioService.postData('/payerticket', data: data);
  }

}
