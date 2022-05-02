import 'package:barberapp/app/modules/company/controllers/company_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/employee_model.dart';

//////////// EmployeeCard //////////////////////////////////////

class EmployeeCard extends StatelessWidget {
  final controller = Get.find<CompanyController>();
  final Employee employee;
  EmployeeCard(this.employee);

  @override
  Widget build(BuildContext context) {
    print("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
    print(controller.company.image);
    print("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(employee.image != ""
                        ? employee.image!
                        : "https://i.imgur.com/pBcut2e.jpeg"),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${employee.firstName} ${employee.lastName}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: (List<int>.generate(5, (i) => i + 1)).map((e) {
                        return Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.orange,
                        );
                      }).toList(),
                    ),
                    Text(
                      "Lorem ipsum sits dolar amet is for publishing",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  controller.openService(employee.services!);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    color: Colors.green,
                  ),
                  child: Text(
                    "Ver Serviços",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
