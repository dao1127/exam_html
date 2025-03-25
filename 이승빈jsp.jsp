<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사원 목록 조회</title>
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2 style="text-align: center;">사원 목록 조회 (EMP 테이블)</h2>

<%
    // 데이터베이스 접속 정보
    String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
    String user = "scott"; 
    String password = "tiger"; 

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        
        Class.forName("oracle.jdbc.driver.OracleDriver");

        
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();

        String sql = "SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO FROM EMP";
        rs = stmt.executeQuery(sql);
%>

<table>
    <tr>
        <th>사원번호</th>
        <th>이름</th>
        <th>직업</th>
        <th>매니저</th>
        <th>입사일</th>
        <th>급여</th>
        <th>보너스</th>
        <th>부서번호</th>
    </tr>
    
    <% while (rs.next()) { %>
    <tr>
        <td><%= rs.getInt("EMPNO") %></td>
        <td><%= rs.getString("ENAME") %></td>
        <td><%= rs.getString("JOB") %></td>
        <td><%= rs.getInt("MGR") %></td>
        <td><%= rs.getDate("HIREDATE") %></td>
        <td><%= rs.getDouble("SAL") %></td>
        <td><%= rs.getDouble("COMM") %></td>
        <td><%= rs.getInt("DEPTNO") %></td>
    </tr>
    <% } %>
</table>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
      
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

</body>
</html>
