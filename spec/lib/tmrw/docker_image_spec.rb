RSpec.describe Tmrw::DockerImage do
  it "inits with a tag" do
    image = Tmrw::DockerImage.new(tag: "test")
    expect(image.tag).to eq("test")
  end

  it "builds a docker image"
  it "raises an exception when docker build fails"
  it "publishes an image to docker registry"
  it "raises an exception when docker push fails"
end
