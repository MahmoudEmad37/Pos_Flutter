import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/modules/internet/features/connection_internet/presentation/cubit/connection_internet_cubit.dart';

PreferredSize customInternetAppBar() {
  final String formattedDate = DateFormat.yMd().format(DateTime.now());
    return PreferredSize(
        preferredSize: const Size.fromHeight(300.0),
        child: SafeArea(
          child:
              BlocConsumer<ConnectionInternetCubit, ConnectionInternetState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ConnectionInternetOnState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0, left: 15.0),
                      child: Icon(
                        Icons.circle,
                        size: 20,
                        color: AppColors.green,
                      ),
                    ),
                    Text(  
                      formattedDate,
                      style: const TextStyle(
                          color: AppColors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 8, 120, 8),
                      child: Icon(
                        Icons.cloud_done_rounded,
                        size: 30,
                        color: AppColors.green,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: Icon(
                        Icons.refresh,
                        size: 30,
                      ),
                    ),
                  ],
                );
              } else if (state is ConnectionInternetOffState) {
                return Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0, left: 15.0),
                      child: Icon(
                        Icons.circle,
                        size: 20,
                        color: AppColors.red,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                          color: AppColors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 8, 150, 8),
                      child: Icon(
                        Icons.cloud_off_outlined,
                        size: 30,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                );
              } else {
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Loading...")],
                );
              }
            },
          ),
        ),
      );
  }