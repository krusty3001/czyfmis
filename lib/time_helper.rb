# Currently not used
#
# Could be helpful later on e.g. to calculate the total playtime of an album
#
module TimeHelper

  def TimeHelper.seconds_to_human(seconds)
    m = seconds / 60
    s = seconds - (m * 60)
    "#{pad(m)}:#{pad(s)}"
  end

  def TimeHelper.human_to_seconds(human)
    m, s = human.split(":")
    m.to_i * 60 + s.to_i
  end

  private

  def TimeHelper.pad(n)
    n < 10 ? "0#{n}" : n.to_s
  end
  
end
