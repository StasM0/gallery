<?php
// DSN stands for "data source name"

class PDOStuff
{
    public $dbname, $pdo, $result, $host, $user, $pass, $error;

    public function __construct($dbname, $host = "localhost", $user = 'root', $pass = "")
    {
        $this->dbname = $dbname;
        $this->$host = $host;
        $this->$user = $user;
        $this->$pass = $pass;
        $charset = 'utf8mb4';
        $dsn = "mysql:host=$host;dbname=$dbname;charset=$charset";
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ];
        $pdo = new PDO($dsn, $user, $pass, $options);
        $this->pdo = $pdo;
    }

    public function fetchAllStuff($table)
    {
        try {
            $pdo = $this->pdo;
            $sql = "SELECT * FROM $table ";
            $statement = $pdo->prepare($sql);
            $statement->execute();
            $result = $statement->fetchAll(PDO::FETCH_ASSOC);
            $this->result = $result;
        } catch (PDOException $e) {
            $this->error = "Error: " . $e->getMessage();
        }
    }

    public function fetchCertainStuff($sql)
    {
        try {
            $pdo = $this->pdo;
            $statement = $pdo->prepare($sql);
            $statement->execute();
            $result = $statement->fetchAll(PDO::FETCH_ASSOC);
            $this->result = $result;
        } catch (PDOException $e) {
            $this->error = "Error: " . $e->getMessage();
        }
    }
    public function IUDStuff($sql, ...$params)
    {
        try {
            $pdo = $this->pdo;
            $statement = $pdo->prepare($sql);
            $statement->execute($params);
        } catch (PDOException $e) {
            $this->error =  "Error: " . $e->getMessage();
        }
    }
}
