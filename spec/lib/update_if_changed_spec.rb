require "rails_helper"

describe "ActiveRecord#update_if_changed" do
  context "with one attribute" do
    let(:foo) { Foo.create(bar: "test") }

    it "updates the record" do
      foo.update_if_changed(bar: "it worked!")
      expect(foo.reload.bar).to eq "it worked!"
    end

    it "doesn't update the record if the record hasn't changed" do
      expect(foo).not_to receive(:update)
      foo.update_if_changed(bar: "test")
    end
  end

  context "with multiple attributes" do
    let(:foo) { Foo.create(bar: "test", baz: 123, qux: true) }

    it "updates the record" do
      foo.update_if_changed(bar: "test", baz: 456, qux: false)
      foo.reload

      expect(foo.bar).to eq "test"
      expect(foo.baz).to eq 456
      expect(foo.qux).to eq false
    end

    it "doesn't update the record if the record hasn't changed" do
      expect(foo).not_to receive(:update)
      foo.update_if_changed(bar: "test", baz: 123, qux: true)
    end
  end
end
