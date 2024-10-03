import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reqres_project/models/reqresModel.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  PostReqres inputData = PostReqres(id: "", name: "", job: "", createdAt: "");
  List<GetReqres> dataRespon = [];

  @override
  void initState() {
    super.initState();
    // Fetch data on initialization
    GetReqres.connApi().then((value) {
      setState(() {
        dataRespon = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navigasi(),
        body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 70, 40, 70),
        child: dataRespon.isNotEmpty
            ? ListView.separated(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  return Container(
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 10),
                            blurRadius: 40,
                            spreadRadius: 0)
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child: Container(
                              width: 170,
                              height: 170,
                              child: Image.network(
                                dataRespon[index].avatar,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                    size: 50,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Text("ID : ${dataRespon[index].id}",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                      const TextStyle(fontSize: 14))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FittedBox(
                          child: Text(
                            dataRespon[index].fullname,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20)),
                          ),
                        ),
                        Text(
                          dataRespon[index].email,
                          style: GoogleFonts.poppins(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(onPressed: (){
                          inputData.postApi("aku", "ganteng");
                        }, child: Text("CLICK"))
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: dataRespon.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
        )
    );
  }

  AppBar Navigasi() {
    return AppBar(
      backgroundColor: Color(0xFFCE9C80),
      title: Text(
        "Reqres",
        style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 23, color: Colors.white)),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
