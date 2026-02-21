<?php
date_default_timezone_set('Asia/Bangkok');
// --- ส่วนการเชื่อมต่อฐานข้อมูล ---
$host = "localhost";
$username = "root";
$password = "pppppppp";     // ** อย่าลืมใส่รหัสผ่านที่ถูกต้องของคุณ **
$dbname = "mtt_1";

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("<div class='alert alert-danger'>Connection failed: " . $conn->connect_error . "</div>");
}
$conn->set_charset("utf8");

// ดึงข้อมูล
$sql = "SELECT * FROM machine_1 ORDER BY redate DESC LIMIT 20";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="th">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Machine Monitoring Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Sarabun:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Sarabun', sans-serif;
            background-color: #f8f9fa;
        }

        .card {
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f4f9;
            transition: 0.3s;
        }

        .badge-volt {
            background-color: #e3f2fd;
            color: #0d6efd;
            font-size: 0.9rem;
        }

        .badge-amp {
            background-color: #fff3e0;
            color: #ef6c00;
            font-size: 0.9rem;
        }

        .header-gradient {
            background: linear-gradient(45deg, #2193b0, #6dd5ed);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            border-bottom-left-radius: 30px;
            border-bottom-right-radius: 30px;
        }
    </style>
</head>

<body>

    <div class="header-gradient text-center">
        <h1 class="display-5 fw-bold">Machine 1 Monitoring</h1>
        <p class="lead">ระบบแสดงผลค่าแรงดันและกระแสไฟฟ้าแบบ Real-time</p>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card p-4">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 class="m-0 text-secondary">รายการข้อมูลล่าสุด</h4>
                        <button onclick="window.location.reload()" class="btn btn-outline-primary btn-sm">อัปเดตข้อมูล</button>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th class="text-center">ลำดับ</th>
                                    <th>วัน-เวลาที่บันทึก</th>
                                    <th class="text-center">Voltage (V)</th>
                                    <th class="text-center">Current (A)</th>
                                    <th class="text-center">สถานะ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if ($result->num_rows > 0) {
                                    while ($row = $result->fetch_assoc()) {
                                        echo "<tr>";
                                        echo "<td class='text-center fw-bold text-muted'>" . $row["no"] . "</td>";
                                        echo "<td>" . date('d/m/Y H:i:s', strtotime($row["redate"])) . "</td>";
                                        echo "<td class='text-center'><span class='badge badge-volt px-3 py-2 rounded-pill'>" . $row["volt"] . " V</span></td>";
                                        echo "<td class='text-center'><span class='badge badge-amp px-3 py-2 rounded-pill'>" . $row["amp"] . " A</span></td>";
                                        echo "<td class='text-center'><span class='text-success'>● Online</span></td>";
                                        echo "</tr>";
                                    }
                                } else {
                                    echo "<tr><td colspan='5' class='text-center py-5 text-muted'>ยังไม่มีข้อมูลในระบบ</td></tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                    <hr>
                    <div class="row align-items-center mt-3">
                        <div class="col-md-auto text-center">
                            <img src="https://github.com/Phuwaset.png"
                                alt="Phuwaset Sibta"
                                class="rounded-circle shadow-sm border border-2 border-primary"
                                style="width: 80px; height: 80px; object-fit: cover;">
                        </div>
                        <div class="col text-center text-md-start mt-2 mt-md-0">
                            <h5 class="mb-1 fw-bold text-dark">Hello! My name is Phuwaset Sibta</h5>
                            <p class="mb-2 text-muted" style="font-size: 0.9rem;">I'm a second year student from Mechatronics Technology Student | KMUTNB</p>
                            <p class="mb-3 text-muted" style="font-size: 0.95rem; line-height: 1.6;">
                                I am a passionate <strong>Mechatronics & Robotics</strong> developer with a strong foundation in
                                <strong>Industrial Automation</strong> and <strong>Software Integration</strong>.
                                My expertise spans from low-level control with <strong>PLCs & Microcontrollers</strong>
                                to high-level robotics using <strong>ROS2, Python, and Computer Vision (YOLO)</strong>.
                                I bridge the gap between hardware and software to build intelligent, real-time monitoring solutions.
                            </p>
                            <div class="mb-3">
                                <span class="badge bg-dark">ROS2 / Gazebo</span>
                                <span class="badge bg-secondary">PLC Mitsubishi</span>
                                <span class="badge bg-info text-dark">Control Systems</span>
                                <span class="badge bg-warning text-dark">Delphi & PHP</span>
                                <span class="badge bg-success">YOLO & OpenCV</span>
                            </div>
                            <div class="d-flex justify-content-center justify-content-md-start gap-2">
                                <a href="https://github.com/Phuwaset" target="_blank" class="btn btn-dark btn-sm rounded-pill px-3">
                                    GitHub
                                </a>
                                <a href="https://www.linkedin.com/in/phuwaset-sibta-333120320" target="_blank" class="btn btn-primary btn-sm rounded-pill px-3">
                                    LinkedIn
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <p class="text-center mt-4 text-muted" style="font-size: 0.8rem;">
                    © 2026 Machine Monitoring System | พัฒนาด้วย PHP และ Bootstrap 5
                </p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>