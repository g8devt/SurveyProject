class APIResult {
  dynamic message;

  // dynamic jwt;
  dynamic profileId;

  // dynamic userStatus;
  // dynamic applicationID;
  dynamic transactionNumber;
  dynamic value;
  dynamic result;

  // dynamic version;
  // dynamic versionPopActive;
  // dynamic maintenance;
  // String? code;
  String? dateRequested;
  dynamic status;

  APIResult({
    this.message,
    this.result,
    this.profileId,
    this.dateRequested,
    this.status,
    this.value,
    this.transactionNumber,
  });

  @override
  String toString() {
    return 'APIResult{message: $message, result: $result, dateRequested: $dateRequested, status: $status, transactionNumber: $transactionNumber,}';
  }
}
