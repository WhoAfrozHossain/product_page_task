class AppUrls {
  static String _baseUrl =
      "http://crmapi.educationat.org.goldeninfotech.com.bd/api/";

  String imageBaseUrl = "http://crmapi.educationat.org.goldeninfotech.com.bd/";

  static const String dummyImageUrl =
      'https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg';

  static const String placeHolderBlurHash = 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';

  String signIn = "${_baseUrl}login";
  String signUp = "${_baseUrl}registration";
  String me = "${_baseUrl}me";
  String passwordRecovery = "${_baseUrl}reset/password";
  String dashboard = "${_baseUrl}dashboard";
  String leads = "${_baseUrl}leads/all?";
  String assignAble = "${_baseUrl}staffs/assignable";
  String source = "${_baseUrl}leads/source/all";
  String leadsProfile = "${_baseUrl}leads/";
  String addNewLeads = "${_baseUrl}leads";
  String additionalFilter = "${_baseUrl}leads/additionalFilter/all";
  String leadsConvert = "${_baseUrl}leads/convert/all";
  String customFiledAll = "${_baseUrl}leads/customfields/all";
  String leadsStatusAll = "${_baseUrl}leads/status/all";

  // Tasks
  String taskOverview = "${_baseUrl}tasks/overview/all";
  String taskPriority = "${_baseUrl}tasks/priorities";
  String taskStatus = "${_baseUrl}tasks/status/all";
  String taskRelatedTo = "${_baseUrl}tasks/relatedto";
  String taskRepeat = "${_baseUrl}tasks/repeat";
  String createAndUpdateTask = "${_baseUrl}tasks";
  String updateTask = "${_baseUrl}tasks/";

  // String getAllTasks = "${_baseUrl}leads/task/all";
  String getAllTasks = "${_baseUrl}tasks";
  String task = "${_baseUrl}tasks/";
  String countries = "${_baseUrl}countries";
  String leadTasks = "${_baseUrl}leads/task/";
  String tasksAttachment = "${_baseUrl}tasks/attachment";
  String leadAttachment = "${_baseUrl}leads/attachment";

  String taskProject = "${_baseUrl}projects/list/nonpagination";
  String taskInvoice = "${_baseUrl}task/invoice";
  String taskCustomer = "${_baseUrl}clients/list/all";
  String taskEstimate = "${_baseUrl}task/estimate";
  String taskContract = "${_baseUrl}task/contract";
  String taskTicket = "${_baseUrl}task/ticket";
  String taskExpense = "${_baseUrl}task/expense";
  String taskLead = "${_baseUrl}leads/nonpaginate/all";
  String taskProposal = "${_baseUrl}task/proposal";

  // Customer
  String customerOverview = "${_baseUrl}clients/summery/all";
  String client = "${_baseUrl}clients";
  String note = "${_baseUrl}notes";
  String countryFor = "${_baseUrl}customer/groups";
  String companies = "${_baseUrl}companies";
  String activityLog = "${_baseUrl}leads/activity";
  String leadsCVS = "${_baseUrl}leads/csv";
  String customFieldsForCustomer = "${_baseUrl}customvalues/customers";
  String customFieldsForProjects = "${_baseUrl}customvalues/projects";

  String customerAdmin = "/assign/members";

  var taskSearch = "${_baseUrl}tasks/search";

  String projectOverview = "${_baseUrl}projects/overview/all";

  String projectStatus = "${_baseUrl}projects/status/all";

  String projects = "${_baseUrl}projects";

  String getProjects = "${_baseUrl}projects/names/all";
  String updateProject = "${_baseUrl}projects/names";
  String projectName = "${_baseUrl}projects/names";

  String getAllMembers = "${_baseUrl}clients/list/all";

  String projectsAddCustomer = "${_baseUrl}projects/add/customer";

  String assignedProjects = "${_baseUrl}projects";

  String tags = "${_baseUrl}tags";
}
