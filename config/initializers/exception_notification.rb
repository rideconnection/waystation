#Exception Notification
Rails.application.config.middleware.use ExceptionNotifier,
    :email_prefix => '[Waystation] ',
    :sender_address => 'apps@rideconnection.org',
    :exception_recipients => ['kchambers@rideconnection.org']
