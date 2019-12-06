import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  TextEditingController _eventController;
  List<dynamic> _selectedEvents;
  String qualquercoisa = "";

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: (){})
        ],
        title: Text("Calendário"),
        backgroundColor: Colors.green[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TableCalendar(

              events: _events,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.orange,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white),
                  selectedColor: Colors.green[800],
                  selectedStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
              ),
              onDaySelected: (date, events) {
                // print(date.toIso8601String());
                setState(() {
                  _selectedEvents = events;
                });
              },
              calendarController: _controller,
            ),
            ..._selectedEvents.map((event) => ListTile(
                  title: Text(event),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: _showAddDialog),
    );
  }

  _showAddDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _events[_controller.selectedDay] = ["Alugada"];
                          qualquercoisa = "Alugada";
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        "Alugada",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _events[_controller.selectedDay] = ["A confirmar"];
                          qualquercoisa = "A confirmar";
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        "A confirmar",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.yellow[800],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _events[_controller.selectedDay].clear();
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        "Disponível",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green[800],
                    ),
                  )
                ],
              ),
//              content: TextField(
//                controller: _eventController,
//              ),
              // actions: <Widget>[
//                FlatButton(
//                    onPressed: () {
//                      if (_eventController.text.isEmpty) return;
//                      setState(() {
//                        if (_events[_controller.selectedDay] != null) {
//                          _events[_controller.selectedDay]
//                              .add(_eventController.text);
//                        } else {
//                          _events[_controller.selectedDay] = [
//                            _eventController.text
//                          ];
//                        }
//                        _eventController.clear();
//                        Navigator.pop(context);
//                      });
//
//                    },
//                    child: Text("Salvar"))
              //],
            ));
  }
}
