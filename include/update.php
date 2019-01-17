<?php 
// koneksi database
include 'koneksi.php';

// menangkap data yang di kirim dari form
$id = $_POST['id'];
$no_faktur = $_POST['no_faktur'];
$tanggal = $_POST['tanggal'];
$keterangan = $_POST['keterangan'];
$pemasukan = $_POST['pemasukan'];
$pengeluaran = $_POST['pengeluaran'];

// update data ke database
mysqli_query($koneksi,"update data set no_faktur='$no_faktur', tanggal='$tanggal', keterangan='$keterangan', pemasukan='$pemasukan', pengeluaran='$pengeluaran' where id='$id'");

// mengalihkan halaman kembali ke index.php
header("location:../lihat_data.php");

?>