/* 
 * Author: Affine Sol (PVT LTD) - https://affinesol.com/ 
 * Last Modified: 27/11/2024 at 16:11:39
 */

import 'package:getx_clean_architecture/app/models/user_model.dart';

abstract class AuthService {
  Future<void> performAuth(User user);
}
