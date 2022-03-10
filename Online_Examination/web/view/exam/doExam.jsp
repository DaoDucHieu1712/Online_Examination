<%-- 
    Document   : doExam
    Created on : Mar 9, 2022, 10:04:26 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            html {
                font-size: 62.5%;
                font-family: "Poppins", sans-serif;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                list-style-type: none;
                text-decoration: none;
            }

            body {
                letter-spacing: 1px;
                width: 100%;
                height: 100vh;
            }

            a {
                color: #555;
            }

            .header {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                background-color: white;
                color: #555;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 25px;
                font-size: 1.6rem;
                font-weight: bold;
                box-shadow: 0 0 3px 4px #eee;
                z-index: 100000;
            }
            .header__logo {
                font-size: 2.2rem;
            }
            .header__bar {
                margin-right: 50px;
                font-size: 2rem;
                background-color: #ccc;
                border-radius: 50%;
                padding: 10px 11px;
                cursor: pointer;
                transition: 0.25s linear;
            }
            .header__bar:hover {
                transform: rotate(180deg);
            }
            .header__list {
                display: flex;
            }
            .header__items {
                margin: 0 15px;
                transition: 0.25s linear;
            }
            .header__items:hover {
                font-size: 1.5rem;
            }
            .header__items a:hover {
                color: #0eb582;
            }
            .header__account {
                position: relative;
                padding-right: 100px;
            }
            .header__account i {
                cursor: pointer;
            }
            .header__dropdown {
                position: absolute;
                width: 250px;
                left: -20px;
                top: 40px;
                border-radius: 1rem;
                padding: 10px;
                background-color: rgba(14, 181, 130, 0.5);
                opacity: 0;
                visibility: hidden;
                transition: 0.25s linear;
            }
            .header__dropdown-items {
                padding: 8px;
                margin-bottom: 8px;
                transition: 0.25s linear;
                font-size: 1.3rem;
            }
            .header__dropdown-items:hover {
                background-color: rgba(14, 181, 130, 0.9);
            }
            .header__dropdown-items i {
                margin-right: 8px;
            }

            .is-show {
                opacity: 1;
                visibility: visible;
            }

            .sidebar {
                position: fixed;
                top: 90px;
                left: 0;
                background-color: white;
                height: 100vh;
                width: 250px;
                overflow-y: scroll;
                z-index: 1;
            }
            .sidebar::-webkit-scrollbar {
                width: 10px;
            }
            .sidebar::-webkit-scrollbar-thumb {
                background-color: #0eb582;
            }
            .sidebar::-webkit-scrollbar-track {
                background-color: #eee;
            }
            .sidebar__heading {
                color: #0eb582;
                font-size: 2.1rem;
                font-weight: bold;
                text-transform: uppercase;
                margin: 50px 0px 50px 10px;
                position: relative;
            }
            .sidebar__heading::before {
                content: "";
                position: absolute;
                width: 50px;
                height: 5px;
                background-color: #0eb582;
                bottom: 0;
                border-radius: 3px;
            }
            .sidebar__items {
                font-weight: bold;
                font-size: 1.6rem;
                margin-bottom: 25px;
                text-align: center;
                transition: 0.25s linear;
            }
            .sidebar__items:hover {
                margin-left: 25px;
            }
            .sidebar__items a {
                color: #555;
            }
            .sidebar__items i {
                margin-left: 7px;
                color: #0eb582;
            }

            /*# sourceMappingURL=home.css.map */
            .section {
                width: 1200px;
                min-height: 600px;
                margin: 150px auto;
                background-color: white;
                box-shadow: 0 0 3px 3px #eee;
                padding: 35px;
                border-radius: 1rem;
                display: flex;
                flex-direction: row;
                flex-wrap: nowrap;
                justify-content: space-between;
            }
            .section__time {
                width: 20%;
                height: 50%;
                padding: 15px;
            }
            .section__countdown {
                font-size: 1.6rem;
                font-weight: bold;
            }
            .section__countdown span:first-child {
                margin-left: 10px;
                color: #0eb582;
            }
            .section__countdown span:not(:first-child) {
                color: #0eb582;
            }
            .section__exam {
                width: 75%;
                padding: 15px;
                border: 2px solid #0eb582;
            }
            .section__quiz {
                font-size: 1.4rem;
                margin: 10px 0 30px 0;
            }
            .section__quiz span {
                font-size: 1.6rem;
                text-transform: uppercase;
                display: block;
                margin-bottom: 15px;
                font-weight: bold;
                color: #0eb582;
            }
            .section__form {
                font-size: 1.3rem;
                margin: 25px 20px;
            }
            .section__submit {
                margin-top: 70px;
                font-weight: bold;
                font-size: 1.5rem;
                color: #555;
                display: block;
                margin-left: 80%;
                border: none;
                outline: none;
                padding: 12px 30px;
                border: 2px solid #0eb582;
                background-color: white;
                cursor: pointer;
                transition: 0.25s linear;
            }
            .section__submit:hover {
                background-color: #0eb582;
                color: white;
            }
            .section__lable {
                padding-left: 50px;
                position: relative;
                cursor: pointer;
            }
            .section__lable::before {
                content: "";
                position: absolute;
                top: 50%;
                left: 0;
                transform: translateY(-50%);
                width: 23px;
                height: 23px;
                border-radius: 50%;
                background-color: rgba(14, 181, 130, 0.5);
            }
            .section__lable::after {
                content: "";
                position: absolute;
                top: 50%;
                left: 5px;
                width: 13px;
                height: 13px;
                border-radius: 50%;
                transform: translateY(-50%);
                background-color: #0eb582;
                opacity: 0;
                visibility: hidden;
            }
            .section__input {
                display: none;
            }
            .section__input:checked + .section__lable::after {
                opacity: 1;
                visibility: visible;
            }

            /*# sourceMappingURL=doExam.css.map */

        </style>
        <script type="text/javascript">
            window.onload = counter;
            function counter()
            {
                minutes = ${minutes}
                seconds = ${seconds};
                countDown();
            }
        </script>
        <script type="text/javascript">
            function countDown() {
                document.getElementById("min").innerHTML = minutes;
                document.getElementById("remain").innerHTML = seconds;
                document.getElementById("minute").value = minutes;
                document.getElementById("second").value = seconds;
                setTimeout("countDown()", 1000);
                if (minutes == 0 && seconds == 0)
                {
                    document.getElementById("timeout").value = 1;
                    document.getElementById("quiz_form").submit();
                } else
                {
                    seconds--;
                    if (seconds == 0 && minutes > 0)
                    {
                        minutes--;
                        seconds = 60;
                    }
                }
            }
            function checkOption() {
                var checkbox = document.getElementsByName("answers");
                var check = 0;
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked)
                        check++;
                }
                if (check == 4 || check == 0)
                    return true;
                else
                    return false;
            }
            function checkEmpty() {
                if (checkOption()) {
                    alert("Please tick your answers!");
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </head>
    <body>
        <header class="header">
            <div class="header__home">
                <i class="fa-solid fa-bars header__bar"></i>
                <a href="../auth/home" class="header__logo"><i class="fa-solid fa-user-graduate header__icon"></i>Exam.</a>
            </div>
            <ul class="header__list">
                <li class="header__items"><a href="../auth/home">Home</a></li>
                <li class="header__items"><a href="../auth/home">About</a></li>
                <li class="header__items"><a href="schedules">Exam Schedules</a></li>
                <li class="header__items"><a href="../feedback/insert">Feedback</a></li>
            </ul>
            <div class="header__account">
                <c:if test="${sessionScope.account eq null}">
                    <a href="../login" class="header__user"><i
                            class="fa-solid fa-user header__account-icon"></i></a> 
                    </c:if>
                    <c:if test="${sessionScope.account ne null}">
                    <span class="header__name">${sessionScope.account.full_name} <i onclick="show_dropdown()"
                                                                                    class="fa-solid fa-caret-down"></i></span>
                    </c:if>
                <ul class="header__dropdown">
                    <li class="header__dropdown-items"><a href="../auth/infomation"><i class="fa-solid fa-user-check"></i>infomation</a></li>
                    <li class="header__dropdown-items"><a href="../auth/changepassword"><i class="fa-solid fa-lock"></i>change password</a></li>
                    <li class="header__dropdown-items"><a href="../logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </header>

        <div class="section">
            <div class="section__exam">
                <form action="doExam" method="get" id="quiz_form">
                    <div class="section__quiz">
                        <span>Question ${no_quiz + 1}</span>
                        <p class="section__question">
                            ${question.quiz}
                        </p>
                    </div>
                    <div class="section__group">
                        <div class="section__form">
                            <input type="radio" name="answer" value="1" class="section__input" id="section__input1">
                            <label for="section__input1" class="section__lable">${question.op1}</label>
                        </div>
                        <div class="section__form">
                            <input type="radio" name="answer"  value="2" class="section__input" id="section__input2">
                            <label for="section__input2" class="section__lable">${question.op2}</label>
                        </div>
                        <div class="section__form">
                            <input type="radio" name="answer" value="3" class="section__input" id="section__input3">
                            <label for="section__input3" class="section__lable">${question.op3}</label>
                        </div>
                        <div class="section__form">
                            <input type="radio" name="answer" value="4" class="section__input" id="section__input4">
                            <label for="section__input4" class="section__lable">${question.op4}</label>
                            <input type="radio" name="answer" hidden checked value="999" class="section__input" id="section__input4">
                        </div>
                        <div class="section__form">
                            <button type="submit" class="section__submit">${button}</button>
                        </div>
                        <input type="hidden" name="question_no" value="${no_quiz}" id="quiz_no"/>
                        <input type="hidden" name="mark" value="${mark}" />
                        <input id="minute" name="minutes" type="hidden" />
                        <input id="second" name="seconds" type="hidden" />
                        <input name="exam_id" type="hidden" value="${exam_id}" />
                        <input id="timeout" name="timeOut" type="hidden" value="0" />

                    </div>
                </form>
            </div>
            <div class="section__time">
                <p class="section__countdown">Time left 
                    <span id="min"></span>
                    <span>:</span>
                    <span id="remain"></span></p>
            </div>
        </div>
        <script>
            function show_dropdown() {
                document.querySelector('.header__dropdown').classList.toggle('is-show');
            }
        </script>
    </body>
</html>
