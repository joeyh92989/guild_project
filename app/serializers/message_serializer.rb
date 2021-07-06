class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :sender, :message, :created_at
end
