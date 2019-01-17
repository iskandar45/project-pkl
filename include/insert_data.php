<?php 
// koneksi database
include 'koneksi.php';

// menangkap data yang di kirim dari form
$no_faktur = $_POST['no_faktur'];
$tanggal = $_POST['tanggal'];
$keterangan = $_POST['keterangan'];
$pemasukan = $_POST['pemasukan'];
$pengeluaran = $_POST['pengeluaran'];
// menginput data ke database
mysqli_query($koneksi,"insert into data values('','$no_faktur','$tanggal','$keterangan','$pemasukan','$pengeluaran')");

// mengalihkan halaman kembali ke index.php
header("location:../lihat_data.php");

?>