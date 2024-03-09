<?php include_once 'helpers/helper.php'; ?>
<!-- log on to codeastro.com for more projects -->
<?php subview('header.php'); ?>
<?php if(isset($_SESSION['userId'])) {   
    require 'helpers/init_conn_db.php';                      
?> 
<style>
body {
	background: url("/AIRFLYER-latest/assets/backgroundimg.jpg") no-repeat 0 0;
    background-size: cover;
    background-attachment: fixed;
    background-position: center;
}
@font-face {
  font-family: 'product sans';
  src: url('assets/css/Product Sans Bold.ttf');
}
div.out {
    padding: 30px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); 
    border-top-left-radius: 20px;
    border-bottom-right-radius: 20px;
}
.city {
    font-size: 24px;
}
p {
    margin-bottom: 10px;
    font-family: product sans;
}
.alert {
    /* font-family: 'Courier New', Courier, monospace; */
    font-weight: bold;
}
.date {
    font-size: 24px;
}
.time {
    font-size: 27px;
    margin-bottom: 0px;
}
.stat {
    font-size: 17px;
}
h1 {
    font-weight: lighter !important;
    font-size: 45px !important;
    margin-bottom: 20px;  
    font-family :'product sans' !important;
    font-weight: bolder;
  }
.row {
    background-color: white;
}
@font-face {
  font-family: 'product sans';
  src: url('assets/css/Product Sans Bold.ttf');
  }

</style>
<main><!-- log on to codeastro.com for more projects -->
    <div class="container">
    <h1 class="text-center text-light mt-4 mb-4">FLIGHT STATUS</h1>
    <?php 
    $stmt_t = mysqli_stmt_init($conn);
    $sql_t = 'SELECT * FROM Ticket WHERE user_id=?';
    $stmt_t = mysqli_stmt_init($conn);
    if(!mysqli_stmt_prepare($stmt_t,$sql_t)) {
        header('Location: ticket.php?error=sqlerror');
        exit();            
    } else {
        mysqli_stmt_bind_param($stmt_t,'i',$_SESSION['userId']);            
        mysqli_stmt_execute($stmt_t);
        $result_t = mysqli_stmt_get_result($stmt_t);
        while($row_t = mysqli_fetch_assoc($result_t)) {     
            $stmt = mysqli_stmt_init($conn);
            $sql = 'SELECT * FROM Passenger_profile WHERE passenger_id=?';
            $stmt = mysqli_stmt_init($conn);
            if(!mysqli_stmt_prepare($stmt,$sql)) {
                header('Location: my_flights.php?error=sqlerror');
                exit();            
            } else {
                mysqli_stmt_bind_param($stmt,'i',$row_t['passenger_id']);            
                mysqli_stmt_execute($stmt);
                $result = mysqli_stmt_get_result($stmt);
                if ($row = mysqli_fetch_assoc($result)) {
                    $sql_f = 'SELECT * FROM Flight WHERE flight_id=? ';
                    $stmt_f = mysqli_stmt_init($conn);
                    if(!mysqli_stmt_prepare($stmt_f,$sql_f)) {
                        header('Location: my_flights.php?error=sqlerror');
                        exit();            
                    } else {
                        mysqli_stmt_bind_param($stmt_f,'i',$row_t['flight_id']);            
                        mysqli_stmt_execute($stmt_f);
                        $result_f = mysqli_stmt_get_result($stmt_f);
                        if($row_f = mysqli_fetch_assoc($result_f)) {

                            $date_time_dep = $row_f['departure'];
                            $date_dep = substr($date_time_dep,0,10);
                            $time_dep = substr($date_time_dep,10,6) ;    
                            
                            $return_date_time_dep = $row_f['return_dep'];
                            $return_date_dep = substr($return_date_time_dep,0,10);
                            $return_time_dep = substr($return_date_time_dep,10,6) ;
                            
                            $date_time_arr = $row_f['arrivale'];
                            $date_arr = substr($date_time_arr,0,10);
                            $time_arr = substr($date_time_arr,10,6) ;
                            
                            $return_date_time_arr = $row_f['return_arr'];
                            $return_date_arr = substr($return_date_time_arr,0,10);
                            $return_time_arr = substr($return_date_time_arr,10,6) ;


                            if($row_f['status'] === '') {
                                $status = "Not yet Departed";
                                $alert = 'alert-primary';
                            } else if($row_f['status'] === 'dep') {
                                $status = "Departed";
                                $alert = 'alert-info';
                            } else if($row_f['status'] === 'issue') {
                                $status = "Delayed";
                                $alert = 'alert-danger';
                            } else if($row_f['status'] === 'arr') {
                                $status = "Arrived";
                                $alert = 'alert-success';
                            }                           
                            echo '
                            <div class="row out mb-5 ">
                                <div class="col-md-4 order-lg-3 order-md-1"> ';    
                                if($row_f['status'] === 'arr') {
                                    echo '
                                    <div class="row">
                                        <div class="col-1 p-0 m-0">
                                            <i class="fa fa-circle mt-4 text-success"
                                                style="float: right;"></i>
                                        </div>                            
                                        <div class="col-10 p-0 m-0 mt-3" style="float: right;">
                                            <hr class="bg-success">
                                        </div>                            
                                        <div class="col-1 p-0 m-0">
                                            <i class="fa fa-2x fa-fighter-jet mt-3 text-success"
                                                ></i>
                                        </div>                                    
                                    </div>                            
                                    ';
                                } else {
                                    echo '
                                    <div class="row">
                                        <br>
                                        <br> 
                                        <br>                           
                                    </div> 
                                    <div class="row">
                                        <div class="col-1 p-0 m-0">
                                            <i class="fa fa-2x fa-fighter-jet mt-3 text-success"
                                                style="float: right;"></i>
                                        </div>
                                        <div class="col-10 p-0 m-0 mt-3" style="float: right;">
                                            <hr style="background-color: lightgrey;">
                                        </div>   
                                        <div class="col-1 p-0 m-0">
                                            <i class="fa fa-circle mt-4"
                                                style="color: lightgrey;"></i>
                                        </div>                             
                                    </div>                         
                                    ';
                                }                     
                                    echo '
                                </div>
                        
                                <div class="col-md-3 col-6 order-md-2 pl-0 text-center 
                                    order-lg-2 card-dep">
                                    <h4> Name: '.$row['f_name'].'   '.$row['l_name'] .' </h4>     
                                    <p class="city">'.$row_f['source'].'</p>
                                    <p class="stat">Scheduled Departure:</p>
                                    <p class="date">'.$date_dep.'</p>                
                                    <p class="time">'.$time_dep.'</p>
                                </div>        
                                <div class="col-md-3 col-6 order-md-4 pr-0 text-center 
                                    order-lg-4 card-arr" 
                                    style="float: right;">
                                    <br>
                                    <p class="city">'.$row_f['Destination'].'</p>
                                    <p class="stat">Scheduled Arrival:</p>
                                    <p class="date">'.$date_arr.'</p>                
                                    <p class="time">'.$time_arr.'</p>          
                                </div>
                                <div class="col-lg-2 order-md-12">
                                    <div class="alert '.$alert.' mt-5 text-center" 
                                        role="alert">
                                        '.$status.'
                                    </div>
                                </div>          
                            </div> ';
                            
                            if(!($return_date_dep == '0000-00-00')){
                                echo '
                                <div class="row out mb-5 ">
                                    <div class="col-md-4 order-lg-3 order-md-1"> ';    
                                    if($row_f['status'] === 'arr') {
                                        echo '
                                        <div class="row">
                                            <div class="col-1 p-0 m-0">
                                                <i class="fa fa-circle mt-4 text-success"
                                                    style="float: right;"></i>
                                            </div>                            
                                            <div class="col-10 p-0 m-0 mt-3" style="float: right;">
                                                <hr class="bg-success">
                                            </div>                            
                                            <div class="col-1 p-0 m-0">
                                                <i class="fa fa-2x fa-fighter-jet mt-3 text-success"
                                                    ></i>
                                            </div>                                    
                                        </div>                            
                                        ';
                                    } else {
                                        echo '
                                        <div class="row">
                                            <br>
                                            <br> 
                                            <br>                           
                                        </div> 
                                        <div class="row">
                                            <div class="col-1 p-0 m-0">
                                                <i class="fa fa-2x fa-fighter-jet mt-3 text-success"
                                                    style="float: right;"></i>
                                            </div>
                                            <div class="col-10 p-0 m-0 mt-3" style="float: right;">
                                                <hr style="background-color: lightgrey;">
                                            </div>   
                                            <div class="col-1 p-0 m-0">
                                                <i class="fa fa-circle mt-4"
                                                    style="color: lightgrey;"></i>
                                            </div>                             
                                        </div>                         
                                        ';
                                    }                     
                                        echo '
                                    </div>
                            
                                    <div class="col-md-3 col-6 order-md-2 pl-0 text-center 
                                        order-lg-2 card-dep">
                                        <h4> Name: '.$row['f_name'].'   '.$row['l_name'] .' </h4>
                                        <p class="city">'.$row_f['Destination'].'</p>
                                        <p class="stat">Scheduled Departure:</p>
                                        <p class="date">'.$return_date_dep.'</p>                
                                        <p class="time">'.$return_time_dep.'</p>
                                    </div>        
                                    <div class="col-md-3 col-6 order-md-4 pr-0 text-center 
                                        order-lg-4 card-arr" 
                                        style="float: right;">
                                        <br>
                                        <p class="city">'.$row_f['source'].'</p>
                                        <p class="stat">Scheduled Arrival:</p>
                                        <p class="date">'.$return_date_arr.'</p>                
                                        <p class="time">'.$return_time_arr.'</p>          
                                    </div>
                                    <div class="col-lg-2 order-md-12">
                                        <div class="alert '.$alert.' mt-5 text-center" 
                                            role="alert">
                                            '.$status.'
                                        </div>
                                    </div>          
                                </div> ';
                            }
                                          
                        }
                    }            
                }
            }    
        }
    }
    ?>    
</div>

</main>     
<?php } ?>
<?php subview('footer.php'); ?> 
