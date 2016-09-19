module Kernel
  private

  def __method_name__
    caller[0] =~ /`([^']*)'/ and $1
  end
end
