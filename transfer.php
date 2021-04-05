
<?php
session_start();
if(!isset($_SESSION['userId'])){ header('location:login.php');}
?>
<!DOCTYPE html>
<html>
<head>
  <title>Banking</title>
  <?php require 'assets/autoloader.php'; ?>
  <?php require 'assets/db.php'; ?>
  <?php require 'assets/function.php'; ?>
  <?php
    $error = "";
    if (isset($_POST['userLogin']))
    {
      $error = "";
        $user = $_POST['email'];
        $pass = $_POST['password'];

        $stmt = $con->prepare("select * from userAccounts where email=? AND password=?");
        $stmt->bind_param('ss',$user,$pass);
			  $stmt->execute();
    		$result = $stmt->get_result();
        if($result->num_rows == 1)
        {
          session_start();
          $data = $result->fetch_assoc();
          $_SESSION['userId']=$data['id'];
          $_SESSION['user'] = $data;
          header('location:index.php');
         }
        else
        {
          $error = "<div class='alert alert-warning text-center rounded-0'>Username or password wrong try again!</div>";
        }
    }

   ?>
</head>
<body style="background:#38c8bf;background-size: 100%">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
 <a class="navbar-brand" href="#">
    <img src="images/logo2.png" width="30" height="30" class="d-inline-block align-top" alt="">
   <!--  <i class="d-inline-block  fa fa-building fa-fw"></i> --><?php echo bankname; ?>
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link " href="index.php">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item ">  <a class="nav-link" href="accounts.php">Accounts</a></li>
      <li class="nav-item ">  <a class="nav-link" href="statements.php">Account Statements</a></li>
      <li class="nav-item active">  <a class="nav-link" href="transfer.php">Funds Transfer</a></li>
      <!-- <li class="nav-item ">  <a class="nav-link" href="profile.php">Profile</a></li> -->


    </ul>
    <?php include 'sideButton.php'; ?>
  </div>
</nav><br><br><br>
<div class="container">
  <div class="card  w-75 mx-auto">
  <div class="card-header text-center">
    Funds Transfer
  </div>
  <div class="card-body">
      <form method="POST">
          <div class="alert alert-success w-50 mx-auto">
            <h5>New Transfer</h5>
            <input type="text" name="accNo" class="form-control " placeholder="Enter Receiver Account number" required>
            <button type="submit" name="rashmi_madam" class="btn btn-primary btn-bloc btn-sm my-1">Get Account Info</button>
          </div>
      </form>
      <?php if (isset($_POST['rashmi_madam']))
      {
        $array2 = $con->query("select * from userAccounts where accountNo = '$_POST[accNo]'");
        {
           if ($array2->num_rows > 0 and $userData['accountNo']!==$_POST['accNo']) {
           $row2 = $array2->fetch_assoc();
            echo "<div class='alert alert-success w-50 mx-auto'>
                  <form method='POST'>
                    Account No.
                    <input type='text' value='$row2[accountNo]' name='accNo' class='form-control ' readonly required>
                    Account Holder Name.
                    <input type='text' class='form-control' value='$row2[name]' readonly required>
                    Account Holder Bank Name.
                    <input type='text' class='form-control' value='".bankname."' readonly required>
                    Enter Amount for transfer.
                    <input type='number' name='amount' class='form-control' min='1' max='$userData[balance]' required>
                    <button type='submit' name='transferSelf' class='btn btn-primary btn-bloc btn-sm my-1'>Transfer</button>
                  </form>
                </div>";
          }
          elseif($userData['accountNo']===$_POST['accNo']){
            echo "<div class='alert alert-success w-50 mx-auto'>You can't transfer money into the same account</div>";
          }
          else
            echo "<div class='alert alert-success w-50 mx-auto'>Account No. $_POST[accNo] does not exist in our bank</div>";
        }
      }
      ?>
    <br>
    <h5>Transfer History</h5>
    <?php
    // if (isset($_POST['transferSelf']))
    // {
    //   $amount = $_POST['amount'];
    //   setBalance($amount,'debit',$userData['accountNo']);
    //   setBalance($amount,'credit',$_POST['otherNo']);
    //   makeTransaction('transfer',$amount,$_POST['otherNo']);
    //   echo "<script>alert('Transfer Successfull');window.location.href='transfer.php'</script>";
    // }
    if (isset($_POST['transferSelf']) and $userData['accountNo']!==$_POST['accNo'])
    {
      $amount = $_POST['amount'];
      setBalance($amount,'debit',$userData['accountNo']);
      setBalance($amount,'credit',$_POST['accNo']);
      makeTransaction('transfer',$amount,$_POST['accNo']);
      echo "<script>alert('Transfer Successful');window.location.href='transfer.php'</script>";
    }
      $array = $con->query("select * from transaction where userId = '$userData[id]' AND action = 'transfer' order by date desc");
      if ($array ->num_rows > 0)
      {
         while ($row = $array->fetch_assoc())
         {
            if ($row['action'] == 'transfer')
            {
              echo "<div class='alert alert-warning'>Transfer has been made for ₹.$row[debit] from your account at $row[date] to account number $row[beneficiaryAcc]</div>";
            }

         }
      }
      else
        echo "<div class='alert alert-info'>You have made no transfer yet.</div>";
    ?>
  </div>
  <div class="card-footer text-muted">
   <?php echo bankname ?>
  </div>
</div>

</div>
</body>
</html>
