import 'package:hive/hive.dart';

import '../models/categorymodels/sourse_model.dart';

class SourseModelAdapter extends TypeAdapter<SourseModel> {
  @override
  final int typeId = 1;

  @override
  SourseModel read(BinaryReader reader) {
    return SourseModel(
      id: reader.readInt(),
      image: reader.readString(),
      title: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, SourseModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.image);
    writer.writeString(obj.title);
  }
}
