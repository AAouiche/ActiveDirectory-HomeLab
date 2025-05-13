# ActiveDirectory-HomeLab  
*A hands-on lab environment for learning Active Directory, Group Policy, and Windows Server 2019 administration using Oracle VirtualBox.*

---

## Environments and Technologies Used  
- Oracle VirtualBox  
- Active Directory Domain Services  
- PowerShell  
- Windows Server 2019  
- Windows 10  

---

## Configuration Steps  

### 1. Install Required Software  
Download and install:  
- [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)  
- [Windows Server 2019](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019)  
- [Windows 10](https://www.microsoft.com/en-us/software-download/windows10)  

---

### 2. Setting Up the Virtual Machine  

#### Create a New Virtual Machine  
1. Open Oracle VirtualBox and click "New"  
   ![New VM creation](https://github.com/user-attachments/assets/cfd9724a-54e3-4d07-afe1-4dcc70e4d12c)  

2. Configure settings:  
   - **OS Type**: Other Windows (64-bit)  
   - **Network Adapters**:  
     - Adapter 1: NAT  
     - Adapter 2: Internal Network  
   ![Network adapter settings](https://github.com/user-attachments/assets/ff45fe68-31ed-4dd5-a510-304870e799e2)  

---

### 3. Install Windows Server 2019  

#### Initial Setup  
1. Start the VM - you may encounter:  
   > "Failed to boot"  
   ![Boot error](https://github.com/user-attachments/assets/8045fbaf-604f-4bab-b6d5-ccdf3128d12e)  

2. Resolution:  
   - Click the down arrow  
   - Select "Other"  
   - Browse to your Windows Server ISO location  

#### Installation Process  
1. Select:  
   - **Standard Evaluation (Desktop experience)**  
   ![OS selection](https://github.com/user-attachments/assets/e16b4e4a-5793-4cf9-9512-02772910b758)  

2. Choose:  
   - **Custom: Install Windows only**  
   ![Install type](https://github.com/user-attachments/assets/8ecc9202-a063-4d78-86c9-c3c36d8f3ff1)  

---

### 4. Configure Active Directory  

#### Install AD DS Role  
1. Open Server Manager  
2. Click "Add roles and features"  
3. Select "Active Directory Domain Services" and install  
   ![AD DS installation](https://github.com/user-attachments/assets/cb14ffe5-b953-458c-a621-6d368ac810a9)  

#### Promote to Domain Controller  
1. Click the notifications icon  
2. Select "Promote this server to a domain controller"  
   ![Promote to DC](https://github.com/user-attachments/assets/0d3ada19-f8af-4ef7-92d0-9a1f986ce45f)  

3. Configure:  
   - Add a new forest  
   - Enter your domain name  
   - Complete remaining settings and install  
   ![New forest configuration](https://github.com/user-attachments/assets/301cf2b7-6e93-44b7-a8e7-32f33f614be6)  

---

### 5. Configure Routing and Remote Access  

#### Install Remote Access Role  
1. Add roles and features  
2. Select "Remote Access"  
   ![Remote Access selection](https://github.com/user-attachments/assets/d0746525-96a2-43c9-a69e-df56dd1b262b)  

3. Select "Routing"  
   ![Routing selection](https://github.com/user-attachments/assets/ea8856f0-b24a-4672-87f9-46a064c9970e)  
4. Complete installation  

#### Configure NAT  
1. Open "Routing and Remote Access" from Tools menu  
   ![RRAS tool](https://github.com/user-attachments/assets/98802fbe-dbeb-48ec-bc07-a952d1c8ff68)  

2. Select "Configure and Enable Routing and Remote Access"  
   ![Configuration wizard](https://github.com/user-attachments/assets/0c4f728b-cbcb-4d03-a7f1-d830bc235db0)  

3. Choose "NAT" configuration  
   ![NAT selection](https://github.com/user-attachments/assets/d82c2c90-115c-4131-abc0-6060ba7ef6c4)  

---

### 6. Configure DHCP Server  

#### Install DHCP Role  
1. Add roles and features  
2. Select "DHCP Server"  
   ![DHCP selection](https://github.com/user-attachments/assets/9a153f23-67b9-4b02-8b18-1174b0d44caa)  

#### Configure DHCP Scope  
1. Open DHCP Manager from Tools menu  
   ![DHCP Manager](https://github.com/user-attachments/assets/ae2e0987-ffda-4248-ae64-c8d152c98cd0)  

2. Set your IP address ranges  
   ![IP range configuration](https://github.com/user-attachments/assets/e0e29555-069f-4132-a083-4f5b2f7d0b7d)  

3. Add IP addresses to be used by clients  
   ![Client IP configuration](https://github.com/user-attachments/assets/730f95c1-9d17-4f30-bf17-a765a0cd6dd9)  

---

### 7. Add Users Using PowerShell  

#### Download and Run User Creation Script  
1. Download the PowerShell script folder from repository:  
   [ActiveDirectory-HomeLab/Scripts](https://github.com/AAouiche/ActiveDirectory-HomeLab/tree/main/Scripts)  
2. Run PowerShell ISE as administrator and open `1_CREATE_USERS.ps1`  
   ![PowerShell ISE](https://github.com/user-attachments/assets/66d5bd57-fbe0-4127-a464-27ee49f4725d)  
   ![Script open](https://github.com/user-attachments/assets/2967a475-ffbb-4b1a-bb1e-96416b7e5a2b)  

3. Change execution policy to unrestricted:  
   ![Execution policy](https://github.com/user-attachments/assets/84040f73-95d4-4eef-91ee-241223f35e6a)  

4. Change directory to where the scripts folder is and run:  
   ![Script execution](https://github.com/user-attachments/assets/4a29ae82-7191-4105-92b5-68efb358d899)  

---

### 8. Configure Windows Client VM  

#### Create Client VM  
1. Create a new VM using the installed Windows ISO  
   ![New client VM](https://github.com/user-attachments/assets/0e948bc9-e6ee-4f4d-a3e2-5039944c7a1e)  

#### Network Configuration  
1. Open Settings > Network Connections  
2. Identify the adapter with IP 172.16.0.1  
   ![Network adapter](https://github.com/user-attachments/assets/161e369d-6987-4177-85fb-bf534017080f)  
3. Click Properties > IPv4 and configure:  
   ![IPv4 configuration](https://github.com/user-attachments/assets/38692f25-a4da-43f8-b5a5-745e257f73f9)  

#### Join Domain  
1. Go to Settings > About > Rename this PC  
   ![Rename PC](https://github.com/user-attachments/assets/8d5856d1-ed76-4d68-b900-7a5d5e37bc0d)  
2. Join domain using domain admin credentials when prompted  
   ![Domain join](https://github.com/user-attachments/assets/308c1da7-c8c0-4521-a149-7f1ccb3fc548)  
3. Verify connection with `ipconfig` - should show domain-issued IP and gateway  

---

## Completion  
Your Active Directory lab environment is now fully configured with:  
- Domain controller  
- DHCP services  
- User accounts  
- Client machine joined to domain  


