class Patient:

    def __init__(self, age, sex, sbp, dbp, comorbidities,
                 smoking, pneumonia, respiratory_rate,
                 heart_rate, confusion, albumin,
                 pao2_fio2, pao2, o2_saturation, xray_status,
                 multilobar, urea_nitrogen, neoplastic,
                 liver, congestive_heart, cerebrovascular,
                 renal, temperature, sodium, glucose, hematocrit,
                 arterial_ph, lymphocytes, coinfection, temp_units):
        self.age = age
        self.sex = sex
        self.sbp = sbp
        self.dbp = dbp
        self.comorbidities = comorbidities
        self.smoking = smoking
        self.pneumonia = pneumonia
        self.respiratory_rate = respiratory_rate
        self.heart_rate = heart_rate
        self.confusion = confusion
        self.albumin = albumin
        self.pao2_fio2 = pao2_fio2
        self.pao2 = pao2
        self.o2_sat = o2_saturation
        self.xray_status = xray_status
        self.multilobar = multilobar
        self.urea_n = urea_nitrogen
        self.neoplastic = neoplastic
        self.liver = liver
        self.chf = congestive_heart
        self.cvd = cerebrovascular
        self.renal = renal
        if temp_units == 'F':
            self.temp = (temperature - 32) / 1.8
        else:
            self.temp = temperature
        self.blood_sodium = sodium
        self.blood_glucose = glucose
        self.hematocrit = hematocrit
        self.arterial_ph = arterial_ph
        self.lymphocytes = lymphocytes
        self.coinfection = coinfection
        self.smart_cop_score_full = 0
        self.smart_cop_score_trunc = 0
        self.mulbsta_score = 0
        self.psi_port_score = 0
        self.scap_score = 0
        self.smart_cop_risk = 0
        self.mulbsta_risk = 0
        self.psi_port_risk = 0
        self.scap_risk = 0

    def calculate_map(self):
        map_bp = (self.sbp + 2 * self.dbp) / 3
        return map_bp

    # Need to have a method for holding onto values while waiting for blood test results

    def determine_smart_cop(self):
        if self.albumin is None or self.arterial_ph is None or self.pao2 is None:
            if self.sbp == "< 90 mmHg":
                self.smart_cop_score_trunc += 2
            if self.multilobar == 'Yes':
                self.smart_cop_score_trunc += 1
            if self.age not in ["51 - 60", "61 - 70", "71 - 80", "80+"] and self.respiratory_rate == ">=25":
                self.smart_cop_score_trunc += 1
            if self.age in ["51 - 60", "61 - 70", "71 - 80", "80+"] and self.respiratory_rate == ">=30":
                self.smart_cop_score_trunc += 1
            if self.heart_rate == "<125 bpm":
                self.smart_cop_score_trunc += 1
            if self.confusion == 'Yes':
                self.smart_cop_score_trunc += 1
        else:
            if self.sbp == "< 90 mmHg":
                self.smart_cop_score_full += 2
            if self.multilobar == 'Yes':
                self.smart_cop_score_full += 1
            if self.albumin == '<3.5 g/dL':
                self.smart_cop_score_full += 1
            if self.age not in ["51 - 60", "61 - 70", "71 - 80", "80+"] and self.respiratory_rate == ">=25":
                self.smart_cop_score_full += 1
            if self.age in ["51 - 60", "61 - 70", "71 - 80", "80+"] and self.respiratory_rate == ">=30":
                self.smart_cop_score_full += 1
            if self.heart_rate == "<125 bpm":
                self.smart_cop_score_full += 1
            if self.confusion == 'Yes':
                self.smart_cop_score_full += 1
            if self.age not in ["51 - 60", "61 - 70", "71 - 80", "80+"]:
                if self.pao2 == "<70" or self.o2_sat == "<=93" or self.pao2_fio2 == "<333":
                    self.smart_cop_score_full += 2
            if self.age in ["51 - 60", "61 - 70", "71 - 80", "80+"]:
                if self.pao2 == "<60" or self.o2_sat == "<=90" or self.pao2_fio2 == "<250":
                    self.smart_cop_score_full += 2
            if self.arterial_ph == "<7.35":
                self.smart_cop_score_full += 2

    def determine_mulbsta_score(self):
        if self.multilobar:
            self.mulbsta_score += 5
        if self.lymphocytes == '<.8':
            self.mulbsta_score += 4
        if self.smoking == 'Prior smoker':
            self.mulbsta_score += 2
        if self.smoking == 'Current smoker':
            self.mulbsta_score += 3
        if self.coinfection == 'Yes':
            self.mulbsta_score += 4
        if self.comorbidities == 'Hypertension':
            self.mulbsta_score += 2
        if self.age in ["61 - 70", "71 - 80", "80+"]:
            self.mulbsta_score += 2

    def determine_psi_port(self):
        if self.age == '80+':
            age = self.age.split('+')
        else:
            age = self.age.split(' - ')
        if self.sex == 'Male':
            self.psi_port_score += age[0]
        elif self.sex == 'Female':
            self.psi_port_score += (age[0] - 10)
        if self.neoplastic == 'Yes':
            self.psi_port_score += 30
        if self.liver == 'Yes':
            self.psi_port_score += 20
        if self.chf == 'Yes':
            self.psi_port_score += 10
        if self.cvd == 'Yes':
            self.psi_port_score += 10
        if self.renal == 'Yes':
            self.psi_port_score += 10
        if self.confusion == 'Yes':
            self.psi_port_score += 20
        if self.heart_rate == "<125 bpm":
            self.psi_port_score += 10
        if self.respiratory_rate > 30:
            self.psi_port_score += 20
        if self.sbp == "< 90 mmHg":
            self.psi_port_score += 20
        if self.temp == "<35" or self.temp == ">=40":
            self.psi_port_score += 15
        if self.arterial_ph == "<7.35":
            self.psi_port_score += 30
        if self.urea_n == ">30":
            self.psi_port_score += 20
        if self.blood_sodium == "<130":
            self.psi_port_score += 20
        if self.blood_glucose == ">=250":
            self.psi_port_score += 10
        if self.hematocrit == "<30":
            self.psi_port_score += 10

    def determine_scap_score(self):
        if self.arterial_ph < 7.30:
            self.scap_score += 2
        if self.sbp == "< 90 mmHg":
            self.scap_score += 2
        if self.confusion == 'Yes':
            self.scap_score += 1
        if self.urea_n == ">30":
            self.scap_score += 1
        if self.respiratory_rate == '>30':
            self.scap_score += 1
        if self.pao2_fio2 == "<250":
            self.scap_score += 1
        if self.pao2 == "<54":
            self.scap_score += 1
        if self.age == '80+':
            self.scap_score += 1

    def check_smart_cop_risk(self):
        self.determine_smart_cop()
        if self.albumin is None or self.arterial_ph is None or self.pao2 is None:
            if self.smart_cop_score_trunc == 0:
                self.smart_cop_risk = 0
            elif self.smart_cop_score_trunc == 1:
                self.smart_cop_risk = 1
            elif self.smart_cop_score_trunc == 2:
                self.smart_cop_risk = 2
            elif self.smart_cop_score_trunc == 3:
                self.smart_cop_risk = 3
            elif self.smart_cop_score_trunc >= 4:
                self.smart_cop_risk = 4
        else:
            if 0 <= self.smart_cop_score_full <= 2:
                self.smart_cop_risk = 0
            elif 3 <= self.smart_cop_score_full <= 4:
                self.smart_cop_risk = 2
            elif 5 <= self.smart_cop_score_full <= 6:
                self.smart_cop_risk = 3
            elif self.smart_cop_score_full >= 7:
                self.smart_cop_risk = 4
        return self.smart_cop_risk

    def check_mulbsta_risk(self):
        self.determine_mulbsta_score()
        if self.mulbsta_score <= 8:
            self.mulbsta_risk = 0
        elif 9 <= self.mulbsta_score <= 11:
            self.mulbsta_risk = 2
        elif 12 <= self.mulbsta_score <= 13:
            self.mulbsta_risk = 3
        elif self.mulbsta_score > 14:
            self.mulbsta_risk = 4

    def check_psi_port_risk(self):
        self.determine_psi_port()
        if self.psi_port_score < 20:
            self.psi_port_risk = 0
        elif 20 <= self.psi_port_score < 70:
            self.psi_port_risk = 1
        elif 70 <= self.psi_port_score < 90:
            self.psi_port_risk = 2
        elif 90 <= self.psi_port_score < 130:
            self.psi_port_risk = 3
        elif self.psi_port_score >= 130:
            self.psi_port_risk = 4

    def check_scap_risk(self):
        self.determine_scap_score()
        if self.scap_score >= 2:
            self.scap_risk = 4
        else:
            self.scap_risk = 0

    def give_results(self):
        self.check_smart_cop_risk()
        self.check_mulbsta_risk()
        self.check_psi_port_risk()
        self.check_scap_risk()
        return "SMART-COP Score: " + str(self.smart_cop_score_full) + \
               ', SMART-COP Risk Assessment: ' + str(self.smart_cop_risk) + '. MuLBSTA Score: ' + str(
            self.mulbsta_score) + \
               ', MuLBSTA Risk Assessment: ' + str(self.mulbsta_risk) + '. PSI/PORT Score: ' + str(
            self.psi_port_score) + \
               ', PSI/PORT Risk Assessment: ' + str(self.psi_port_risk) + '. SCAP Score: ' + str(self.scap_score) + \
               ', SCAP Risk Assessment: ' + str(self.scap_risk) + '.'


# Example patient
input_list = [] # List from user input
johnny = Patient(*input_list)

johnny.give_results()
