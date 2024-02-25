// try {
//     ApiService.post(
//       body: {
//         "amount": 2000,
//         "currency": "EGP",
//         "payment_methods": [4503979],
//         "items": [
//           {
//             "name": "Item name",
//             "amount": 2000,
//             "description": "Item description",
//             "quantity": 1
//           }
//         ],
//         "billing_data": {
//           "apartment": "dumy",
//           "first_name": "ala",
//           "last_name": "zain",
//           "street": "dumy",
//           "building": "dumy",
//           "phone_number": "+923459989111",
//           "city": "dumy",
//           "country": "dumy",
//           "email": "ali@gmail.com",
//           "floor": "dumy",
//           "state": "dumy"
//         }
//       },
//       url: 'https://accept.paymob.com/v1/intention/',
//       token:
//           'Token egy_sk_test_2f470ee9344a349deb818bbecf0c50277744b201edfb86407c19c9d5f87e65aa',
//     ).then((value) => log('intent created successfully'));
//   } catch (error) {
//     log('error happened: ${error.toString()}');
//   }