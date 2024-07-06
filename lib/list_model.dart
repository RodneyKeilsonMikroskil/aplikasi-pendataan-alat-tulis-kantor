// class ItemRow {
//   final String atkcode;
//   final String title;
//   final String description;
//   final String amount;
//   final String satuan;

//   ItemRow({
//     required this.atkcode,
//     required this.title,
//     required this.description,
//     required this.amount,
//     required this.satuan,
//   });
// }
class RequestCard {
  final String programstudi;
  final String tanggalpermintaan;
  final String tanggalpengambilan;
  final String namapenerima;
  bool isCheckVisible;
  bool isRemoveVisible;

  RequestCard({
    required this.programstudi,
    required this.tanggalpermintaan,
    required this.tanggalpengambilan,
    required this.namapenerima,
    this.isCheckVisible = true,
    this.isRemoveVisible = true,
  });
}

class ItemRow {
  final String kodeatk;
  final String namaatk;
  final String jenis;
  final String jumlah;
  final String satuan;

  ItemRow({
    required this.kodeatk,
    required this.namaatk,
    required this.jenis,
    required this.jumlah,
    required this.satuan,
  });

  ItemRow copyWith({
    String? kodeatk,
    String? namaatk,
    String? jenis,
    String? jumlah,
    String? satuan,
  }) {
    return ItemRow(
      kodeatk: kodeatk ?? this.kodeatk,
      namaatk: namaatk ?? this.namaatk,
      jenis: jenis ?? this.jenis,
      jumlah: jumlah ?? this.jumlah,
      satuan: satuan ?? this.satuan,
    );
  }
}

class RequestCard2 {
  final String programstudi;
  final String tanggalpermintaan;
  final String quantity;
  final String namaatk; // Add this field
  bool isCheckVisible;
  bool isRemoveVisible;

  RequestCard2({
    required this.programstudi,
    required this.tanggalpermintaan,
    required this.quantity,
    required this.namaatk, // Add this parameter
    this.isCheckVisible = true,
    this.isRemoveVisible = true,
  });
}