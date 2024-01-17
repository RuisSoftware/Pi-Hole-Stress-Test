# Pi-hole Stress Test Toolkit

This toolkit is designed to assess the performance and capacity of a Pi-hole server by generating a large number of DNS requests. It includes two methods for executing the test: a PowerShell script for advanced users and a batch file for beginners.

## Components

- `pihole-stress-test.ps1`: A PowerShell script for sending DNS queries to a Pi-hole server.
- `StartPiHoleTest.bat`: A batch file for an interactive experience, ideal for beginners.

## Usage

### For Advanced Users (PowerShell Script)
1. Download `pihole-stress-test.ps1`.
2. Open PowerShell and navigate to the script's location.
3. Run the script with parameters: 
   ```powershell
   .\pihole-stress-test.ps1 -PiHoleIP "your_pihole_ip" -QueryCount desired_number_of_queries -Delay desired_delay
    ```
Replace your_pihole_ip, desired_number_of_queries, and desired_delay with your specific values.

### For Beginners (Batch File)
1. Download pihole-stress-test.ps1 and StartPiHoleTest.bat.
2. Run StartPiHoleTest.bat.
3. Enter the Pi-hole IP address, number of queries, and delay between queries when prompted.
4. The script will execute and start sending DNS queries to your Pi-hole server.

### Parameters Explanation
- PiHoleIP: The IP address of your Pi-hole server.
- QueryCount: The total number of DNS requests to be sent.
- Delay: The delay (in milliseconds) between each DNS request.

### Warning
Use this toolkit responsibly. It is intended for testing purposes only and should not be used on networks without proper authorization.

### Contributions
Contributions are welcome. Feel free to fork, modify, and make pull requests.

### License
MIT License

### Support and Contact
For support, please open an issue on the GitHub page. For direct inquiries, please contact [Your Contact Information].

### Acknowledgements
- The Pi-hole project: https://pi-hole.net