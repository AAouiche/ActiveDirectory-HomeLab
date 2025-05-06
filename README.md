# ActiveDirectory-HomeLab  
*A hands-on lab environment for learning Active Directory, Group Policy, and Windows Server 2019 administration using Oracle VirtualBox.*

---

## Environments and Technologies Used  
- Oracle VirtualBox  
- Active Directory Domain Services  
- PowerShell  

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

#### Boot the Virtual Machine  
1. Start the VM - you may encounter:  
   > "Failed to boot"  

![Boot error](https://github.com/user-attachments/assets/8045fbaf-604f-4bab-b6d5-ccdf3128d12e)  

2. Resolution:  
   - Click the down arrow  
   - Select "Other"  
   - Browse to your Windows Server ISO location  

#### Complete Installation  
1. Select:  
   - **Standard Evaluation (Desktop experience)**  

![OS selection](https://github.com/user-attachments/assets/e16b4e4a-5793-4cf9-9512-02772910b758)  

2. Choose:  
   - **Custom: Install Windows only**  

![Install type](https://github.com/user-attachments/assets/8ecc9202-a063-4d78-86c9-c3c36d8f3ff1)  
