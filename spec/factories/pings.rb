FactoryBot.define do

  factory :device do

    # "3d0cce9c-b1e0-e8d7-e598-3c4510422cdd"
    identifier { SecureRandom.hex.insert(8, '-').insert(13, '-').insert(18, '-').insert(23, '-') }

  end

  factory :ping do

    device

    # Tue, 01 May 2018 05:13:10 UTC +00:00
    # 1525151590
    datetimestamp { rand(10.months).seconds.ago }

  end

end
