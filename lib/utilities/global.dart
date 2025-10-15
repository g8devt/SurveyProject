/// DEVELOPMENT
const bool isProduction = false;

/// CMS CONSTANTS
const String baseURL = 'https://b4w9hdnsh4.execute-api.ap-southeast-1.amazonaws.com/production/';
// const String baseURLGet = 'universal_get';
const String baseURLTransactionPost = 'transaction_post';
const String baseURLTransactionGet = 'transaction_get';
// const String localToken = 'cbKFC2qhammb7WF5rHYLO5OWxpu9WvI6QBi8G';
// const String dbName = 'tingog_db';
const String appName = 'GOV 360';
// const String apiKeyAWS = 'uF95WEJX1U6MEw2kj3l4I4PMfAGJDsgN1DlXPdMf';
const String senderName = 'G8 RDC';

/// User Status
const String userStatusVerified = 'VERIFIED';
const String userStatusForReview = 'FOR REVIEW';
const String userStatusPending = 'PENDING';
const String userStatusNotVerified = 'NOT_VERIFIED';
const String userStatusForVerified = 'FOR VERIFICATION';
const String userStatusDenied = 'DENIED';
const String userStatusGuest = 'GUEST';
const String userStatusDeactivated = 'DEACTIVATED';

/// Default Place
///
/// Screen Name
const String signupScreen = 'signup';
const String forgotPinScreen = 'forgot_pin';

/// For Drawer
enum SupportState {
  unknown,
  supported,
  unsupported,
}

/// Gender
List<String> genderList = ['FEMALE', 'MALE'];

//EMPLOYMENT TYPE
List<String> employmentTypeList = ['Full-time', 'Part-time', 'Self-employed', 'Temporary', 'Contractual', 'Freelance', 'Other', 'Internship', 'Commission-based'];

/// Civil Status
List<String> civilStatusList = [
  'SINGLE',
  'MARRIED',
  'WIDOW',
  'WIDOWER',
  'ANNULLED',
  'DIVORCED',
];


final Map<String, List<String>> validIDTypeAliases = {
  "Driver's License": ["driver's license", "drivers license", "license", "dl"],
  "Firearms License": ["firearms license", "gun license", "firearm license"],
  "Passport": ["passport", "philippine passport", "foreign passport"],
  "National ID/Philippine Identification System (PhilSys) ID": ["national id", "philsys id", "philippine id", "philippine identification system"],
  "UMID Card": ["umid", "unified multi-purpose id", "unified multi purpose id", "umid card"],
  "GSIS ID": ["gsis id", "gsis", "government service insurance system id"],
  "NBI Clearance": ["nbi clearance", "nbi", "national bureau of investigation clearance"],
  "Employee's ID": ["employee id", "company id", "work id", "employee's id"],
  "Professional Regulation Commission (PRC) ID": ["prc id", "prc", "professional regulation commission id"],
  "Senior Citizen ID": ["senior citizen id", "senior id", "senior card"],
  "Voter's ID": ["voter id", "voter's id", "voters id", "comelec id"],
  "Postal ID": ["postal id", "philpost id", "post office id"],
  "Marriage Certificate": ["marriage certificate", "certificate of marriage"],
  "OFW ID": ["ofw id", "overseas filipino worker id", "overseas worker id"],
  "PRC ID": ["prc id", "professional regulation commission id", "prc"],
  "Overseas Employment Certificate (OEC)": ["oec", "overseas employment certificate"],
  "PhilHealth ID": ["philhealth id", "philhealth", "philhealth card"],
  "Barangay ID": ["barangay id", "brgy id", "barangay clearance"],
  "Diplomatic ID": ["diplomatic id", "diplomat id", "dfa id"],
  "TIN ID": ["tin id", "tax identification number", "tin", "bir id"],
  "Police Clearance": ["police clearance", "pnp clearance"],
  "Person’s With Disability (PWD) ID": ["pwd id", "person with disability id", "disabled id"],
  "School ID": ["school id", "student id", "university id", "college id"],
  "Seaman's Book": ["seaman's book", "seafarer's identification", "srb", "sid", "seaman id"],
};

//SCHOOL SECTOR
List<String> schoolSectorList = ['PRIVATE', 'PUBLIC'];

/// Education Attainment
final List<String> educationAttainmentList = [
  'Elementary',
  'Elementary UnderGrad',
  'High School',
  'High School UnderGrad',
  'K-12 Senior High',
  'Vocational Course',
  'College UnderGrad',
  'Some College No Degree',
  'Associates Degree',
  'Bachelors Degree',
];

/// Yes or No
List<String> yesNoList = [
  'YES',
  'NO',
];

List<String> childTypeBirthOptions = [
  "Single",
  "Twin",
  "Triplet",
  "Other",
];

List<String> multipleBirthOptions = [
  "Not Applicable",
  "Single",
  "Twin",
  "Triplet",
  "Other",
];

List<String> birthOrderOptions = [
  "Not Applicable",
  "Single",
  "Twin",
  "Triplet",
  "Other",
];

final List<String> formOwnership = [
  'Individual',
  'Partnership',
  'Corporation',
  'Cooperative',
  'Others',
];

final List<String> scopeOfWork = [
  'New Construction',
  'Erection',
  'Addition',
  'Alteration',
  'Renovation',
  'Conversion',
  'Repair',
  'Moving',
  'Raising',
  'Accessory Building / Structure',
  'Legalization of Existing Building',
  'Others',
];

final List<String> useCharacterOccupancy = [
  'Residential (Dwellings)',
  'Residential',
  'Educational & Recreational',
  'Institutional',
  'Commercial',
  'Light Industrial',
  'Medium Industrial',
  'Assembly (Occupant Load Less Than 1,000)',
  'Assembly (Occupant Load 1,000 or More)',
  'Agricultural',
  'Accessories',
];

final List<String> natureCivilStructure = [
  'STAKING',
  'EXCAVATION',
  'SOIL STABILIZATION',
  'PILING WORKS',
  'FOUNDATION',
  'ERECTION/LIFTING',
  'CONCRETE FRAMING',
  'STRUCTURAL STEEL FRAMING',
  'SLABS',
  'WALLS',
  'PRESTRESS WORKS',
  'MATERIAL TESTING',
  'STEEL TOWERS',
  'STEEL TOWERS',
  'Others',
];

List<String> assistanceMedicalOptions = [
  "Guarantee Letter",
  "Laboratory Request Assistance",
  "Financial Assistance",
  "Medicine",
];

List<String> contactMethods = [
  "Phone Call",
  "Text Message",
  "Email",
];

List<String> whoApplying = [
  "Myself",
  "Others",
];

List<String> validIDTypeList = [
  'Driver\'s License',
  'Firearms License',
  'Passport',
  'National ID/Philippine Identification System (PhilSys) ID',
  'UMID Card',
  'GSIS ID',
  'NBI Clearance',
  'Employee\'s ID',
  'Professional Regulation Commission (PRC) ID',
  'Senior Citizen ID',
  'Voter\'s ID',
  'Postal ID',
  'Marriage Certificate',
  'OFW ID',
  'PRC ID',
  'Overseas Employment Certificate (OEC)',
  'PhilHealth ID',
  'Barangay ID',
  'Diplomatic ID',
  'TIN ID',
  'Police Clearance',
  'Person’s With Disability (PWD) ID',
  'School ID',
  'Seaman\'s Book',
];
