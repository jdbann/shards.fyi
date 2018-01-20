class ShardForm < LuckyRecord::VirtualForm
  allow_virtual repo_name : String

  def validate
    validate_required repo_name
  end

  def submit
    if valid?
      yield self, repo_name.value
    else
      yield self, nil
    end
  end
end
