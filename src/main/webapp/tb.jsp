<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Tableau de bord dynamique</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container-fluid">
  <div class="row">
    <div class="col-md-3">
      <!-- Sidebar -->
      <div class="bg-light border-right" id="sidebar">
        <div class="sidebar-heading">Tableau de bord</div>
        <div class="list-group list-group-flush">
          <a href="#" class="list-group-item list-group-item-action">Option 1</a>
          <a href="#" class="list-group-item list-group-item-action">Option 2</a>
          <a href="#" class="list-group-item list-group-item-action">Option 3</a>
        </div>
      </div>
    </div>

    <div class="col-md-9">
      <!-- Content -->
      <div class="content p-4">
        <h2>Contenu du tableau de bord</h2>
        <p>Ceci est une page de tableau de bord avec Bootstrap.</p>
      </div>
    </div>
  </div>
</div>

</body>
</html>
