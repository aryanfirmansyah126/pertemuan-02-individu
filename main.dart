// HW 2 - Kasir Laundry

enum JenisLayanan { reguler, express }

// Fungsi untuk menghitung total biaya laundry
double hitungTotalLaundry(double berat, JenisLayanan jenis) {
  // Batas minimal berat 2 kg
  double beratMinimal = berat;
  if (beratMinimal < 2) {
    beratMinimal = 2;
  }

  // Biaya awal (7.000 per kg)
  double total = beratMinimal * 7000;

  // Tambahan 50% jika memilih express
  if (jenis == JenisLayanan.express) {
    total = total + (total * 0.5);
  }

  return total;
}

void main() {
  print("__HASIL PERHITUNGAN LAUNDRY___");

  print("1. Reguler 1.5 kg : Rp ${hitungTotalLaundry(1.5, JenisLayanan.reguler).toInt()}");
  print("2. Reguler 2 kg   : Rp ${hitungTotalLaundry(2, JenisLayanan.reguler).toInt()}");
  print("3. Express 3 kg   : Rp ${hitungTotalLaundry(3, JenisLayanan.express).toInt()}");
  print("4. Express 5.5 kg : Rp ${hitungTotalLaundry(5.5, JenisLayanan.express).toInt()}");
}