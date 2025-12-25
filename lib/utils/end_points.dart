class EndPoints {


  ///AUTH
  static final String signup = '/v1/citizen/register';
  static final String fcm = '/fcm-token';
  static final String login = '/v1/citizen/login';
  static final String verifyEmail = '/v1/citizen/verify';
  static final String resendVerifyEmail = '/v1/citizen/request-otp';
  static final String requestCode = '/password/requestCode';
  static final String forgotPassword = '/password/reset-with-code';
  static final String logout = '/logout';

  ///PROFILE
  static final String showProfile = "/profile";
  static final String updateProfile = "/update-profile";


  ///Courses
  static final String indexAgencies = '/v1/agencies';
  static final String indexCities = '/v1/cities';
  static final String indexStates = '/v1/states';
  static final String indexComplaintType = '/v1/complaint-types/1';

  static String showCourse(int courseId) => '/courses/$courseId';

  static String updateCourse(int courseId) => '/updateCourse/$courseId';

  static String deleteCourse(int courseId) => '/courses/$courseId';

  ///Scholarships
  static final String indexScholarships = '/scholarships';
  static final String myApplications = '/myApplications';

  static String showScholarship(int scholarshipId) =>
      '/scholarships//$scholarshipId';

  static String registerScholarship(int scholarshipId) =>
      '/scholarships//$scholarshipId/apply';

  static String updateScholarship(int scholarshipId) =>
      '/scholarships/$scholarshipId';

  static String deleteScholarship(int scholarshipId) =>
      '/scholarships/$scholarshipId';
  static final storeScholarship = '/scholarships';

  ///Levels
  static String indexLevels(int courseId) => '/courses/$courseId/levels';

  static final String registerComplaint=  "/v1/complaints";

  static String myEnrollments() => '/my-all-enrollments';

  static String showLevel(int levelId) => '/levels/$levelId';

  static String storeLevel(int courseId) => '/courses/$courseId/levels';

  static String updateLevel(int levelId) => '/levels/$levelId';

  static String deleteLevel(int levelId) => '/levels/$levelId';

}