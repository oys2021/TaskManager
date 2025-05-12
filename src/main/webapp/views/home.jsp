<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task List</title>
    <link rel="stylesheet" href="/css/styles.css">
     <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome for icons (you're using fa- classes) -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

        <!-- Your custom CSS (optional, but ensure path is correct) -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">

        <!-- Bootstrap JS Bundle (with Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
    <div class="container mt-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="d-flex justify-content-between align-items-center activity">
                        <div><i class="fa fa-clock-o"></i><span class="ml-2">11h 25m</span></div>
                        <div><span class="activity-done">Done Activities(4)</span></div>
                        <div class="icons"><i class="fa fa-search"></i><i class="fa fa-ellipsis-h"></i></div>
                    </div>
                    <div class="mt-3">
                        <ul class="list list-inline">
                            <li class="d-flex justify-content-between">
                                <div class="d-flex flex-row align-items-center"><i class="fa fa-check-circle checkicon"></i>
                                    <div class="ml-2">
                                        <h6 class="mb-0">Kickoff meeting</h6>
                                        <div class="d-flex flex-row mt-1 text-black-50 date-time">
                                            <div><i class="fa fa-calendar-o"></i><span class="ml-2">22 May 2020 11:30 PM</span></div>
                                            <div class="ml-3"><i class="fa fa-clock-o"></i><span class="ml-2">6h</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex flex-row align-items-center">
                                    <div class="d-flex flex-column mr-2">
                                        <div class="profile-image"><img class="rounded-circle" src="https://i.imgur.com/xbxOs06.jpg" width="30"><img class="rounded-circle" src="https://i.imgur.com/KIJewDa.jpg" width="30"><img class="rounded-circle" src="https://i.imgur.com/wwd9uNI.jpg" width="30"></div><span class="date-time">11/4/2020 12:55</span></div>
                                    <i
                                        class="fa fa-ellipsis-h"></i>
                                </div>
                            </li>
                            <li class="d-flex justify-content-between">
                                <div class="d-flex flex-row align-items-center"><i class="fa fa-check-circle checkicon"></i>
                                    <div class="ml-2">
                                        <h6 class="mb-0">User Interview</h6>
                                        <div class="d-flex flex-row mt-1 text-black-50 date-time">
                                            <div><i class="fa fa-calendar-o"></i><span class="ml-2">25 May 2020 12:34 AM</span></div>
                                            <div class="ml-3"><i class="fa fa-clock-o"></i><span class="ml-2">4h</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex flex-row align-items-center">
                                    <div class="d-flex flex-column mr-2">
                                        <div class="profile-image"><img class="rounded-circle" src="https://i.imgur.com/xbxOs06.jpg" width="30"><img class="rounded-circle" src="https://i.imgur.com/wwd9uNI.jpg" width="30"></div><span class="date-time">12/5/2020 12:55</span></div><i class="fa fa-ellipsis-h"></i></div>
                            </li>
                            <li class="d-flex justify-content-between">
                                <div class="d-flex flex-row align-items-center"><i class="fa fa-check-circle checkicon"></i>
                                    <div class="ml-2">
                                        <h6 class="mb-0">Prototyping</h6>
                                        <div class="d-flex flex-row mt-1 text-black-50 date-time">
                                            <div><i class="fa fa-calendar-o"></i><span class="ml-2">17 May 2020 1:34 PM</span></div>
                                            <div class="ml-3"><i class="fa fa-clock-o"></i><span class="ml-2">6h</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex flex-row align-items-center">
                                    <div class="d-flex flex-column mr-2">
                                        <div class="profile-image"><img class="rounded-circle" src="https://i.imgur.com/xbxOs06.jpg" width="30"><img class="rounded-circle" src="https://i.imgur.com/KIJewDa.jpg" width="30"></div><span class="date-time">16/4/2020 1:55</span></div><i class="fa fa-ellipsis-h"></i></div>
                            </li>
                            <li class="d-flex justify-content-between">
                                <div class="d-flex flex-row align-items-center"><i class="fa fa-check-circle checkicon"></i>
                                    <div class="ml-2">
                                        <h6 class="mb-0">Call with client</h6>
                                        <div class="d-flex flex-row mt-1 text-black-50 date-time">
                                            <div><i class="fa fa-calendar-o"></i><span class="ml-2">12 May 2020 12:35 AM</span></div>
                                            <div class="ml-3"><i class="fa fa-clock-o"></i><span class="ml-2">6h</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex flex-row align-items-center">
                                    <div class="d-flex flex-column mr-2">
                                        <div class="profile-image"><img class="rounded-circle" src="https://i.imgur.com/wwd9uNI.jpg" width="30"></div><span class="date-time">11/4/2020 12:55</span></div><i class="fa fa-ellipsis-h"></i></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>
