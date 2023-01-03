import sys

# This imports the previously generated UI file
from ParallelAxis_GUI import Ui_MainWindow

from PyQt5.QtCore import Qt
from PyQt5.QtWidgets import QApplication, QMainWindow

import numpy as np

# Define the the main window class
class MainWindow(QMainWindow, Ui_MainWindow):
    def __init__(self):
        super().__init__()
                
        #Initialize GUI
        self.setupUi(self)
        
        self.CalcParallelAxisButton.clicked.connect(self.Calculate_PA)
        self.CalcBasisChangeButton.clicked.connect(self.Calculate_Basis)       
        
        self.I11_OLD.setText(str(0)) 
        self.I12_OLD.setText(str(0)) 
        self.I13_OLD.setText(str(0))
        self.I22_OLD.setText(str(0)) 
        self.I23_OLD.setText(str(0)) 
        self.I33_OLD.setText(str(0))
        self.Mass.setText(str(0))
        self.r1.setText(str(0))
        self.r2.setText(str(0))
        self.r3.setText(str(0))
        
        self.I11_OLD.editingFinished.connect(self.UpdateOldInertia)
        self.I22_OLD.editingFinished.connect(self.UpdateOldInertia)
        self.I33_OLD.editingFinished.connect(self.UpdateOldInertia)
        self.I12_OLD.editingFinished.connect(self.UpdateOldInertia)
        self.I13_OLD.editingFinished.connect(self.UpdateOldInertia)
        self.I23_OLD.editingFinished.connect(self.UpdateOldInertia)

        
    def UpdateOldInertia(self): 
        
                
        if float(self.I11_OLD.text()) < 0 or float(self.I22_OLD.text()) < 0 or float(self.I33_OLD.text()) < 0:
            self.MessageWindow.setText("Error: You cannot have a negative number for I11, I22, or I33")
            return
        else: 
            self.MessageWindow.setText("")

        
        self.I11_OLD_PA.setText(self.I11_OLD.text())
        self.I22_OLD_PA.setText(self.I22_OLD.text())
        self.I33_OLD_PA.setText(self.I33_OLD.text())
        self.I12_OLD_PA.setText(self.I12_OLD.text())
        self.I13_OLD_PA.setText(self.I13_OLD.text())
        self.I23_OLD_PA.setText(self.I23_OLD.text())

        self.I11_OLD_Basis.setText(self.I11_OLD.text())
        self.I22_OLD_Basis.setText(self.I22_OLD.text())
        self.I33_OLD_Basis.setText(self.I33_OLD.text())
        self.I12_OLD_Basis.setText(self.I12_OLD.text())
        self.I13_OLD_Basis.setText(self.I13_OLD.text())
        self.I23_OLD_Basis.setText(self.I23_OLD.text())


        
        
    def Calculate_PA(self):
        
        if self.Radio_CM_to_P.isChecked():             
            self.I11_NEW_PA.setText(str(float(self.I11_OLD.text()) + float(self.Mass.text())*(float(self.r2.text())**2 + float(self.r3.text())**2)))            
            self.I22_NEW_PA.setText(str(float(self.I22_OLD.text()) + float(self.Mass.text())*(float(self.r1.text())**2 + float(self.r3.text())**2)))            
            self.I33_NEW_PA.setText(str(float(self.I33_OLD.text()) + float(self.Mass.text())*(float(self.r1.text())**2 + float(self.r2.text())**2)))
            
            self.I12_NEW_PA.setText(str(float(self.I12_OLD.text()) - float(self.Mass.text())*float(self.r1.text())*float(self.r2.text())))
            self.I13_NEW_PA.setText(str(float(self.I13_OLD.text()) - float(self.Mass.text())*float(self.r1.text())*float(self.r3.text())))
            self.I23_NEW_PA.setText(str(float(self.I23_OLD.text()) - float(self.Mass.text())*float(self.r2.text())*float(self.r3.text())))
        
        else:
            self.I11_NEW_PA.setText(str(float(self.I11_OLD.text()) - float(self.Mass.text())*(float(self.r2.text())**2 + float(self.r3.text())**2)))            
            self.I22_NEW_PA.setText(str(float(self.I22_OLD.text()) - float(self.Mass.text())*(float(self.r1.text())**2 + float(self.r3.text())**2)))            
            self.I33_NEW_PA.setText(str(float(self.I33_OLD.text()) - float(self.Mass.text())*(float(self.r1.text())**2 + float(self.r2.text())**2)))
            
            self.I12_NEW_PA.setText(str(float(self.I12_OLD.text()) + float(self.Mass.text())*float(self.r1.text())*float(self.r2.text())))
            self.I13_NEW_PA.setText(str(float(self.I13_OLD.text()) + float(self.Mass.text())*float(self.r1.text())*float(self.r3.text())))
            self.I23_NEW_PA.setText(str(float(self.I23_OLD.text()) + float(self.Mass.text())*float(self.r2.text())*float(self.r3.text())))
        
    def Calculate_Basis(self): 
        
        C = np.array([[float(self.DCM_11.text()), float(self.DCM_21.text()), float(self.DCM_31.text())],
                      [float(self.DCM_12.text()), float(self.DCM_22.text()), float(self.DCM_32.text())],
                      [float(self.DCM_13.text()), float(self.DCM_23.text()), float(self.DCM_33.text())]])
        
        I = np.array([[float(self.I11_OLD.text()), float(self.I12_OLD.text()), float(self.I13_OLD.text())],
                      [float(self.I12_OLD.text()), float(self.I22_OLD.text()), float(self.I23_OLD.text())],
                      [float(self.I13_OLD.text()), float(self.I23_OLD.text()), float(self.I33_OLD.text())]])
        
        
        temp = np.matmul(C,I)
        I_NewBasis = np.matmul(temp,np.linalg.inv(C))

        I_NewBasis = np.around(I_NewBasis, 4)   # You can change this number if you need more decimal places
        
        self.I11_NEW_Basis.setText(str(I_NewBasis[0][0]))
        self.I22_NEW_Basis.setText(str(I_NewBasis[1][1]))
        self.I33_NEW_Basis.setText(str(I_NewBasis[2][2]))
        self.I12_NEW_Basis.setText(str(I_NewBasis[0][1]))
        self.I13_NEW_Basis.setText(str(I_NewBasis[0][2]))
        self.I23_NEW_Basis.setText(str(I_NewBasis[1][2]))


    # def closeEvent(self, event):
    #     self.close()
    #     app.quit()

# Start the application
app = QApplication(sys.argv)

window = MainWindow()
window.show()

app.exec_()
