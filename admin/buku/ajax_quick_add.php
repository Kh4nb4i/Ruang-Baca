<?php
include '../../inc/koneksi.php';

if ($koneksi->connect_error) {
    echo json_encode(['status' => 'error', 'message' => 'Koneksi database gagal.']);
    exit;
}

$type = isset($_POST['type']) ? $_POST['type'] : '';
$name = isset($_POST['name']) ? trim($_POST['name']) : '';

if (empty($name)) {
    echo json_encode(['status' => 'error', 'message' => 'Nama tidak boleh kosong.']);
    exit;
}

if ($type === 'penulis') {
    // Cek apakah penulis sudah ada
    $stmt = $koneksi->prepare("SELECT id_penulis FROM tb_penulis WHERE nama_penulis = ?");
    $stmt->bind_param("s", $name);
    $stmt->execute();
    $res = $stmt->get_result();
    if ($res->num_rows > 0) {
        $row = $res->fetch_assoc();
        echo json_encode(['status' => 'success', 'id' => $row['id_penulis'], 'name' => $name]);
    } else {
        $stmt_ins = $koneksi->prepare("INSERT INTO tb_penulis (nama_penulis) VALUES (?)");
        $stmt_ins->bind_param("s", $name);
        if ($stmt_ins->execute()) {
            echo json_encode(['status' => 'success', 'id' => $koneksi->insert_id, 'name' => $name]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Gagal menyimpan ke database.']);
        }
    }
} elseif ($type === 'penerbit') {
    // Cek apakah penerbit sudah ada
    $stmt = $koneksi->prepare("SELECT id_penerbit FROM tb_penerbit WHERE nama_penerbit = ?");
    $stmt->bind_param("s", $name);
    $stmt->execute();
    $res = $stmt->get_result();
    if ($res->num_rows > 0) {
        $row = $res->fetch_assoc();
        echo json_encode(['status' => 'success', 'id' => $row['id_penerbit'], 'name' => $name]);
    } else {
        $stmt_ins = $koneksi->prepare("INSERT INTO tb_penerbit (nama_penerbit) VALUES (?)");
        $stmt_ins->bind_param("s", $name);
        if ($stmt_ins->execute()) {
            echo json_encode(['status' => 'success', 'id' => $koneksi->insert_id, 'name' => $name]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Gagal menyimpan ke database.']);
        }
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Tipe tidak valid.']);
}
?>
