require 'rubygems'

require 'rspec'
require 'buzzerbeater'
require 'webmock'
require 'vcr'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end

# VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr'
  c.hook_into :webmock
end




# shared_context 'web mocks', :api_request => true do
#   # Disable all real connections
#   FakeWeb.allow_net_connect = false

#   before :all do
#     @buzzerbeater_api_url                 = "http://bbapi.buzzerbeater.com/"
#     @buzzerbeater_username                = "username"
#     @buzzerbeater_username_with_umlauts   = "üsernäme"
#     @buzzerbeater_right_auth_code         = "password"
#     @buzzerbeater_wrong_auth_code         = "wrongpassword"
#     @buzzerbeater_umlaut_auth_code        = "pässwörd"
#     @buzzerbeater_no_connection_auth_code = "noconnection"
#     @buzzerbeater_session_id              = "quq0f0rmnmkzjd20xsqg3a55"
#     @buzzerbeater_auth_token              = "A1195FC7B8CE28F9DF53746E05FFB1D73B827C87DE9F60A0FDC6F7120B4BB97A4466B3260AA7C1BD52F2F3205B647A7E0FCAD939CEA2918F1F047D9B2EC0A01ECFEA21186E78816BDCE3BA36F76D213F5178CC88CC366FFC906B429E2EF5DF17D1A36F99B21EF6FB780238D9FE1EBFCD06FF3401"

#     # Error stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}serverError.aspx",
#                          :response => File.expand_path('spec/fixtures/api/ServerError.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}error.aspx?msg=UnknownPlayerID",
#                          :response => File.expand_path('spec/fixtures/api/UnknownPlayerID_error.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}error.aspx?msg=UnknownTeamID",
#                          :response => File.expand_path('spec/fixtures/api/UnknownTeamID_error.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}error.aspx?msg=UnknownSeason",
#                          :response => File.expand_path('spec/fixtures/api/UnknownSeason_error.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}error.aspx?msg=UnknownLeagueID",
#                          :response => File.expand_path('spec/fixtures/api/UnknownLeagueID_error.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}error.aspx?msg=IncorrectParameters",
#                          :response => File.expand_path('spec/fixtures/api/IncorrectParameters_error.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}error.aspx?msg=BoxscoreNotAvailable",
#                          :response => File.expand_path('spec/fixtures/api/BoxscoreNotAvailable_error.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}error.aspx?msg=UnknownMatchID",
#                          :response => File.expand_path('spec/fixtures/api/UnknownMatchID_error.xml'))
#     # (end)

#     # Login stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}login.aspx?login=#{@buzzerbeater_username}&code=#{@buzzerbeater_right_auth_code}",
#                          :response => File.expand_path('spec/fixtures/api/login_success.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}login.aspx?login=#{@buzzerbeater_username}&code=#{@buzzerbeater_wrong_auth_code}",
#                          :response => File.expand_path('spec/fixtures/api/login_failure.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}login.aspx?login=#{@buzzerbeater_username}&code=#{@buzzerbeater_no_connection_auth_code}",
#                          :exception => Exception)
#     # (end)

#     # Logout stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}logout.aspx",
#                          :response => File.expand_path('spec/fixtures/api/logout_success.xml'))
#     # (end)

#     # Teaminfo stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}teaminfo.aspx",
#                          :response => File.expand_path('spec/fixtures/api/teaminfo_without_id.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}teaminfo.aspx?teamid=12345",
#                          :response => File.expand_path('spec/fixtures/api/teaminfo_with_id.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}teaminfo.aspx?teamid=1234567890",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_UnknownTeamID_error.xml'))
#     # (end)

#     # Countries stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}countries.aspx",
#                          :response => File.expand_path('spec/fixtures/api/countries.xml'))
#     # (end)

#     # Arena stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}arena.aspx",
#                          :response => File.expand_path('spec/fixtures/api/arena_without_id.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}arena.aspx?teamid=12345",
#                          :response => File.expand_path('spec/fixtures/api/arena_with_id.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}arena.aspx?teamid=1234567890",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_UnknownTeamID_error.xml'))
#     # (end)

#     # Player stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}player.aspx?playerid=14526287",
#                          :response => File.expand_path('spec/fixtures/api/player_of_my_team.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}player.aspx?playerid=19414135",
#                          :response => File.expand_path('spec/fixtures/api/player_of_other_team.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}player.aspx?playerid=111111111",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_UnknownPlayerID_error.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}player.aspx?playerid=11111111111111",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_ServerError.xml'))
#     # (end)

#     # Roster stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}roster.aspx",
#                          :response => File.expand_path('spec/fixtures/api/roster_without_id.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}roster.aspx?teamid=12345",
#                          :response => File.expand_path('spec/fixtures/api/roster_with_id.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}roster.aspx?teamid=1234567890",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_UnknownTeamID_error.xml'))
#     # (end)

#     # Seasons stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}seasons.aspx",
#                          :response => File.expand_path('spec/fixtures/api/seasons.xml'))
#     # (end)

#     # Leagues stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}leagues.aspx?countryid=1&level=2",
#                          :response => File.expand_path('spec/fixtures/api/leagues_with_countryid_and_level.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}leagues.aspx?countryid=1&level=15",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_IncorrectParameters_error.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}leagues.aspx?countryid=1000&level=1",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_IncorrectParameters_error.xml'))
#     # (end)

#     # Standings stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}standings.aspx",
#                          :response => File.expand_path('spec/fixtures/api/standings_without_league_id_and_season.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}standings.aspx?leagueid=5",
#                          :response => File.expand_path('spec/fixtures/api/standings_with_league_id.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}standings.aspx?season=16",
#                          :response => File.expand_path('spec/fixtures/api/standings_with_season.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}standings.aspx?leagueid=5&season=16",
#                          :response => File.expand_path('spec/fixtures/api/standings_with_league_id_and_season.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}standings.aspx?leagueid=10000&season=16",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_UnknownLeagueID_error.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}standings.aspx?leagueid=1000&season=1",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_UnknownSeason_error.xml'))
#     # (end)

#     # Boxscore stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}boxscore.aspx?matchid=36215201",
#                          :response => File.expand_path('spec/fixtures/api/boxscore.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}boxscore.aspx?matchid=362152010",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_UnknownMatchID_error.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}boxscore.aspx?matchid=36215209",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_BoxscoreNotAvailable_error.xml'))
#     # (end)

#     # Economy stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}economy.aspx",
#                          :response => File.expand_path('spec/fixtures/api/economy.xml'))
#     # (end)

#     # Schedule stubs (fold)
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}schedule.aspx",
#                          :response => File.expand_path('spec/fixtures/api/schedule_without_team_id_and_season.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}schedule.aspx?teamid=34967&season=16",
#                          :response => File.expand_path('spec/fixtures/api/schedule_with_team_id_and_season.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}schedule.aspx?season=16",
#                          :response => File.expand_path('spec/fixtures/api/schedule_with_season.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}schedule.aspx?teamid=34967",
#                          :response => File.expand_path('spec/fixtures/api/schedule_with_team_id.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}schedule.aspx?season=18",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_UnknownSeason_error.xml'))
#     FakeWeb.register_uri(:get,
#                          "#{@buzzerbeater_api_url}schedule.aspx?teamid=1234567890",
#                          :response => File.expand_path('spec/fixtures/api/redirect_to_UnknownTeamID_error.xml'))
#     # (end)
#   end

# end