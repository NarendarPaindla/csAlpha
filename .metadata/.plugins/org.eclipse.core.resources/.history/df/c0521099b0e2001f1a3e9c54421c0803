<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<style>
body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
      }
      .container {
        max-width: 600px;
        margin: 50px auto;
        background: #fff;
        padding: 20px;
        border: 1px solid #dee2e6;
        border-radius: 5px;
      }
      h2 {
        margin-bottom: 20px;
      }
      .form-label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
      }
      .form-control {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ced4da;
        border-radius: 4px;
      }
      .btn {
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        background-color: #007bff;
        color: white;
        cursor: pointer;
      }
      .btn:hover {
        background-color: #0056b3;
      }
      .alert {
        padding: 10px;
        background-color: #d1ecf1;
        border: 1px solid #bee5eb;
        border-radius: 4px;
        margin-bottom: 10px;
        color: #0c5460;
      }
      a {
        color: #007bff;
        text-decoration: none;
      }
      a:hover {
        text-decoration: underline;
      }
</style>
</head>
<body>
<div class="container">
<h2>Register</h2>
<form action="register" method="post">
<div>
<label class="form-label">Username:</label>
<input type="text" name="username" class="form-control" required>
</div>
<div>
<label class="form-label">Email</label>
<input type="email" name="email" class="form-control" required>
</div>
<div>
<label class="form-label">Password</label>
<input type="password" name="password" class="form-control" required>
</div>
<div>
<label class="form-label">Role:</label>
<select name="role" class="form-control" required>
<option value="employee">Employee</option>
<option value="manager">Manager</option>
<option value="admin">Admin</option>
</select>
</div>
<button type="submit" class="btn">Register</button>
</form>
<p style="margin-top: 15px;">
Already registered? <a href="login.jsp">Login here</a>
</p>
</div>
</body>
</html>