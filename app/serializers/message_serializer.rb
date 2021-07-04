class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :sender, :message
end
