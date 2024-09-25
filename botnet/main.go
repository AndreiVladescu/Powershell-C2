package main

import (
        "bufio"
        "fmt"
        "net"
        "os"
        "time"
)

func main() {
        targetIPFile := "C:\\tmp\\target_ip.txt"

        for {
                targetIP, err := readTargetIP(targetIPFile)
                if err != nil {
                        fmt.Println("Error reading target IP:", err)
                        continue
                }

                _, err = net.DialTimeout("ip:icmp", targetIP, 10*time.Second)
                if err != nil {
                        fmt.Println("Target IP", targetIP, "is down")
                } else {
                        fmt.Println("Target IP", targetIP, "is up")
                }

                time.Sleep(8 * time.Second)
        }
}

func readTargetIP(filePath string) (string, error) {
        file, err := os.Open(filePath)
        if err != nil {
                return "", err
        }
        defer file.Close()

        scanner := bufio.NewScanner(file)
        if scanner.Scan() {
                return scanner.Text(), nil
        }

        return "", fmt.Errorf("no target IP found in file")
}