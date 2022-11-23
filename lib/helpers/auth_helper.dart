import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';

class AuthHelper {
  setUserData(response, String uname, String password) {
    if (response['result'] == true) {
      is_logged_in.$ = true;
      username.$ = uname;
      pass.$ = password;
      user_id.$ = response['user']['id'];
      user_name.$ = response['user']['first_name'];
      user_phone.$ = response['user']['phone'];
      user_address.$ = response['user']['address'] != null
          ? response['user']['address']
          : '';
      user_dob.$ = response['user']['dob'];
      user_pin.$ = response['user']['pin'];
      user_city.$ = response['user']['city'];
      user_state.$ = response['user']['state'];
      user_country.$ = response['user']['country'];
      user_email.$ = response['user']['email'];
      user_blood.$ = response['user']['blood_group'];
      user_gender.$ = response['user']['gender'];
      access_token.$ = response['token'];
      role.$ = response['user']['roles'][0]['name'];
      doctor_id.$ = response["doctor id"];
      docimg.$ = response["user"]["image"];
    }
  }

  clearUserData() {
    is_logged_in.$ = false;
    username.$ = "";
    pass.$ = "";
    access_token.$ = "";
    user_id.$ = 0;
    user_name.$ = "";
    user_address.$ = '';
    user_dob.$ = "";
    user_pin.$ = "";
    user_city.$ = "";
    user_state.$ = "";
    user_country.$ = "";
    user_email.$ = "";
    user_phone.$ = "";
    user_blood.$ = "";
    user_gender.$ = "";

    role.$ = "";
    doctor_id.$ = 0;
  }
}
