<?php
require 'phpmailer/PHPMailerAutoload.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $name = $_POST["name"];
  $email = $_POST["email"];
  $message = $_POST["message"];

  $mail = new PHPMailer;
  $mail->isSMTP();
  $mail->Host = 'smtp.elasticemail.com  '; // Replace with your SMTP host
  $mail->SMTPAuth = true;
  $mail->Username = 'padrapatricio@gmail.com'; // Replace with your SMTP username
  $mail->Password = 'AFAC724EA13B7512851EB6A981D5544AABEC'; // Replace with your SMTP password
  $mail->SMTPSecure = 'tls';
  $mail->Port = 2525;

  $mail->setFrom($email, $name);
  $mail->addAddress('your-recipient-email'); // Replace with your recipient email
  $mail->isHTML(true);
  $mail->Subject = 'New Contact Form Submission';
  $mail->Body = $message;

  if ($mail->send()) {
    echo json_encode(array("success" => true));
  } else {
    echo json_encode(array("success" => false));
  }
}
