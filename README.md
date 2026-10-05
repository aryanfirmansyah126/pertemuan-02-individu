# Tugas individu (Sistem Kasir Laundry)

**Nama:** Aryan Firmansyah  
**NIM:** 1124160175 
**Mata Kuliah:** Aplikasi Mobile  


---

## Bagian A — Dokumen Analisis

### 1. Problem Statement
Outlet laundry membutuhkan sistem kasir otomatis untuk menghitung total biaya pencucian baju berdasarkan berat timbangan dan jenis layanan (Reguler/Express), dengan aturan batas minimum berat serta tambahan biaya layanan.

### 2. Actor
* **Kasir / Admin Laundry**: Memasukkan data berat laundry dan jenis layanan pelanggan.
* **Pelanggan**: Menerima rincian dan total biaya pembayaran.

### 3. Input & Output
* **Input**: 
  * `berat` (`double`): Berat timbangan laundry dalam kilogram (kg).
  * `jenis` (`JenisLayanan` / `enum`): Jenis layanan (`reguler` atau `express`).
* **Output**: 
  * `total` (`double`): Nominal rupiah yang harus dibayar.

### 4. Functional Requirement
* **FR-01**: Sistem dapat menghitung total biaya berdasarkan berat laundry.
* **FR-02**: Sistem dapat menerapkan penyesuaian berat minimal jika timbangan di bawah batas 2 kg.
* **FR-03**: Sistem dapat mengkalkulasi biaya tambahan untuk layanan *express*.
* **FR-04**: Sistem menampilkan rincian total pembayaran ke layar.

### 5. Business Rules
* **BR-01**: Tarif dasar laundry adalah Rp7.000 / kg.
* **BR-02**: Berat laundry di bawah 2 kg akan dihitung minimal 2 kg.
* **BR-03**: Layanan *express* dikenakan biaya tambahan sebesar +50% dari total tarif dasar.

---

### 6. Decomposition
Proses perhitungan dipecah menjadi 3 tahapan logika:
1. **Pengecekan Berat Minimal**: Memeriksa apakah berat < 2 kg. Jika ya, disesuaikan menjadi 2 kg.
2. **Perhitungan Tarif Dasar**: Mengalikan berat yang sudah disesuaikan dengan tarif Rp7.000.
3. **Penambahan Biaya Layanan**: Menambahkan biaya 50% jika memilih layanan *express*.

---

### 7. Pattern Recognition
* **Penyesuaian Berat**: Semua input `berat < 2.0 kg` selalu diubah nilainya menjadi `2.0 kg`.
* **Perhitungan Layanan**: Layanan `reguler` menggunakan tarif normal, sedangkan `express` ditambahkan biaya $0.5 \times \text{tarif dasar}$.

---

### 8. Abstraction
* **Enum**:
  * `JenisLayanan`: `{ reguler, express }`

---

### 9. Algorithm
1. Menerima input `berat` dan `jenis`.
2. Buat variabel `beratMinimal = berat`.
3. Jika `beratMinimal < 2`, ubah `beratMinimal = 2`.
4. Hitung `total = beratMinimal * 7000`.
5. Cek jika `jenis == JenisLayanan.express`, maka `total = total + (total * 0.5)`.
6. Kembalikan nilai `total`.

---

### 10. Flowchart

```text
[ MULAI ]
    |
    v
( Input: berat & jenis )
    |
    v
[ Apakah berat < 2 kg? ]
    |                    \
  (YA)                 (TIDAK)
    |                      \
beratMinimal = 2      beratMinimal = berat
    |                      /
    +---------------------+
    |
    v
[ Hitung: total = beratMinimal * 7000 ]
    |
    v
[ Apakah jenis == express? ]
    |                        \
  (YA)                     (TIDAK)
    |                          \
total = total + (total * 0.5)   (Lanjut)
    |                          /
    +-------------------------+
    |
    v
( Return total )
    |
    v
[ SELESAI ]
```
### 11. Pseudocode
FUNCTION hitungTotalLaundry(berat, jenis)
    beratMinimal = berat

    IF beratMinimal < 2 THEN
        beratMinimal = 2
    END IF

    total = beratMinimal * 7000

    IF jenis EQUALS express THEN
        total = total + (total * 0.5)
    END IF

    RETURN total
END FUNCTION





## Bagian B — Tabel Traceability

| Business Rule | Function | Skenario Uji | Expected Output | Status |
| --- | --- | --- | --- | :-: |
| **BR-02** | `hitungTotalLaundry` | Berat 1.5 kg (Reguler) | Dihitung 2 kg -> Rp14.000 | **Sesuai** |
| **BR-01** | `hitungTotalLaundry` | Berat 2.0 kg (Reguler) | 2 kg x Rp7.000 -> Rp14.000 | **Sesuai** |
| **BR-03** | `hitungTotalLaundry` | Berat 3.0 kg (Express) | Rp21.000 + 50% -> Rp31.500 | **Sesuai** |
| **BR-01 & BR-03** | `hitungTotalLaundry` | Berat 5.5 kg (Express) | (5.5 x 7.000) + 50% -> Rp57.750 | **Sesuai** |