
import 'dart:io';

void main() {
  // Data jadwal kuliah
  List<Map<String, String>> jadwalKuliah = [
    {'hari': 'Senin', 'matkul': 'Mobile Programming', 'jam': '08.00'},
    {'hari': 'Selasa', 'matkul': 'Pemrograman Web Lanjut', 'jam': '10.00'},
    {'hari': 'Rabu', 'matkul': 'Data Mining', 'jam': '13.00'},
    {'hari': 'Kamis', 'matkul': 'Game Development', 'jam': '09.00'},
    {'hari': 'sabtu', 'matkul': 'Teori Graf dan Otomata', 'jam': '09.00'},
  ];

  // Data tugas
  List<Map<String, dynamic>> daftarTugas = [
    {
      'nama': 'Tugas Control Flow Dart',
      'matkul': 'Mobile Programming',
      'deadline': '25 Oktober 2026',
      'selesai': false,
    },
    {
      'nama': 'Tugas Pemrograman Web Lanjut',
      'matkul': 'Pemrograman Web Lanjut',
      'deadline': '27 Oktober 2026',
      'selesai': false,
    },
    {
      'nama': 'Review Artikel Jurnal',
      'matkul': 'Data Mining',
      'deadline': '20 Oktober 2026',
      'selesai': true,
    },
  ];

  // Data kegiatan belajar
  List<String> kegiatanBelajar = [
    'Membaca materi kuliah',
    'Mengerjakan tugas',
    'Mengulang materi',
  ];

  String pilihan;

  // DO-WHILE: menu utama ditampilkan berulang
  do {
    print('\n====================================');
    print('          STUDYMATE APP');
    print('    Student Productivity System');
    print('====================================');
    print('1. Lihat Jadwal Kuliah');
    print('2. Lihat Daftar Tugas');
    print('3. Lihat Tugas yang Belum Selesai');
    print('4. Lihat Kegiatan Belajar');
    print('5. Tandai Tugas Selesai');
    print('0. Keluar');
    print('====================================');

    stdout.write('Pilih menu: ');
    pilihan = stdin.readLineSync() ?? '';

    // BREAK: menghentikan program jika memilih keluar
    if (pilihan == '0') {
      print('Terima kasih telah menggunakan StudyMate!');
      break;
    }

    // SWITCH-CASE: menentukan fitur yang dipilih
    switch (pilihan) {
      case '1':
        print('\n--- JADWAL KULIAH ---');

        // FOR: menampilkan seluruh jadwal kuliah
        for (int i = 0; i < jadwalKuliah.length; i++) {
          print(
            '${i + 1}. ${jadwalKuliah[i]['hari']} | '
            '${jadwalKuliah[i]['jam']} | '
            '${jadwalKuliah[i]['matkul']}',
          );
        }
        break;

      case '2':
        print('\n--- DAFTAR TUGAS ---');

        // FOR: menampilkan seluruh tugas
        for (int i = 0; i < daftarTugas.length; i++) {
          var tugas = daftarTugas[i];

          // IF-ELSE: menentukan status tugas
          String status;

          if (tugas['selesai'] == true) {
            status = 'Selesai';
          } else {
            status = 'Belum selesai';
          }

          print('${i + 1}. ${tugas['nama']}');
          print('   Mata kuliah: ${tugas['matkul']}');
          print('   Deadline: ${tugas['deadline']}');
          print('   Status: $status');
        }
        break;

      case '3':
        print('\n--- TUGAS BELUM SELESAI ---');

        int jumlahAktif = 0;

        // WHILE: memeriksa daftar tugas
        int i = 0;

        while (i < daftarTugas.length) {
          var tugas = daftarTugas[i];

          // CONTINUE: melewati tugas yang selesai
          if (tugas['selesai'] == true) {
            i++;
            continue;
          }

          print('${jumlahAktif + 1}. ${tugas['nama']}');
          print('   Deadline: ${tugas['deadline']}');

          jumlahAktif++;
          i++;
        }

        if (jumlahAktif == 0) {
          print('Semua tugas sudah selesai!');
        } else {
          print('Total tugas belum selesai: $jumlahAktif');
        }
        break;

      case '4':
        print('\n--- KEGIATAN BELAJAR ---');

        // FOR: menampilkan daftar kegiatan
        for (int i = 0; i < kegiatanBelajar.length; i++) {
          print('${i + 1}. ${kegiatanBelajar[i]}');
        }

        // WHILE: simulasi pemrosesan kegiatan
        int nomor = 0;

        while (nomor < kegiatanBelajar.length) {
          print('Kegiatan ${nomor + 1} siap dikerjakan.');
          nomor++;
        }
        break;

      case '5':
        print('\n--- TANDAI TUGAS SELESAI ---');

        for (int i = 0; i < daftarTugas.length; i++) {
          print('${i + 1}. ${daftarTugas[i]['nama']}');
        }

        stdout.write('Masukkan nomor tugas: ');
        int? nomorTugas =
            int.tryParse(stdin.readLineSync() ?? '');

        if (nomorTugas == null ||
            nomorTugas < 1 ||
            nomorTugas > daftarTugas.length) {
          print('Nomor tugas tidak valid.');
        } else {
          int indeks = nomorTugas - 1;

          if (daftarTugas[indeks]['selesai'] == true) {
            print('Tugas ini sudah selesai sebelumnya.');
          } else {
            daftarTugas[indeks]['selesai'] = true;
            print('Tugas berhasil ditandai selesai!');
          }
        }
        break;

      default:
        print('Menu tidak tersedia. Silakan coba lagi.');
    }
  } while (true);
}
