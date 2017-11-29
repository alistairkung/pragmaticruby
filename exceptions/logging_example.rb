require 'logger'
$LOG = Logger.new('log_file.log', 'monthly')
$LOG.level = Logger::ERROR

def divide(numerator, denominator)
  $LOG.debug("Numerator: #{numerator}, Denominator: #{denominator}")
  begin
    result = numerator / denominator
  rescue Exception => e
    $LOG.error "error in division!: #{e}"
    result = nil
  end
  return result
end
