class Payment {
  final int period;
  final double scheduledPayment;
  final double principalDue;
  final double interestDue;
  final double principalBalance;
  Payment(this.period, this.scheduledPayment, this.principalDue,
      this.interestDue, this.principalBalance);
}
