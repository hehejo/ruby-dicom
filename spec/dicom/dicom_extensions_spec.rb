# encoding: UTF-8

require 'spec_helper'


module DICOM

  describe DObject, " (Extensions)" do

    before(:each) { @obj = DObject.new(DCM_EXPLICIT_MR_JPEG_LOSSY_MONO2, :verbose => false) }

    it "should have an elements Array" do
      @obj.elements.should be_an Array
    end

    it "should have a #file_meta_information_group_length" do
      @obj.file_meta_information_group_length.value.should_not be_nil
    end

    it "should not respond to an arbitrary method name that should not work" do
      @obj.should_not respond_to :any_method_name_that_should_not_work
    end

    it "should have a number of frames" do
      @obj.num_frames.should be >= 1
    end

    it "should query the DICOM object for the existence of a tag using <methodized-name>? returning true if it exists" do
       @obj.sop_instance_uid?.should be_true
    end

    it "should query the DICOM object for the existence of a tag using <methodized-name>? returning false if it doesnt exist" do
      @obj.sop_instance_uid = nil
      @obj.sop_instance_uid?.should be_false
    end

    it "should query the DICOM object for the existence of a tag using <methodized-name>? returning true if it exists" do
      @obj.sop_instance_uid = "1.2.3.4.5.6"
      @obj.sop_instance_uid?.should be_true
    end

    it "should set the sop_instance_uid to '1.2.3.4.5'" do
      @obj.sop_instance_uid = "1.2.3.4.5"
      @obj.sop_instance_uid.value.should eql "1.2.3.4.5"
    end

    it "should delete the sop_instance_uid" do
      @obj.sop_instance_uid = nil
      @obj.sop_instance_uid?.should be_false
    end

=begin
    it "sets file_meta_information_group_length from a hash value" do
      hash = { :ahash => 4567, :should => "work" }
      @obj.file_meta_information_group_length = hash
      @obj.file_meta_information_group_length.value.should == hash.to_s.to_i
    end


    it "sets file_meta_information_group_length from an array value" do
      arr = [1,2,3,4,5,"string"]
      @obj.file_meta_information_group_length = arr
      @obj.file_meta_information_group_length.value.should == arr.to_s.to_i
    end

    it "sets file_meta_information_group_length from a float value" do
      float = 1267.38991
      @obj.file_meta_information_group_length = float
      @obj.file_meta_information_group_length.value.should == float.to_s.to_i
    end
=end

    it "should set file_meta_information_group_length from an integer value" do
      integer = 12345
      @obj.file_meta_information_group_length = integer
      @obj.file_meta_information_group_length.value.should == integer.to_s.to_i
    end

=begin
    it "sets file_meta_information_group_length from an object value" do
      object = Object.new
      @obj.file_meta_information_group_length = object
      @obj.file_meta_information_group_length.value.should == object.to_s.to_i
    end

    it "sets file_meta_information_group_length from a string value" do
      string = "this is a string value"
      @obj.file_meta_information_group_length = string
      @obj.file_meta_information_group_length.value.should == string.to_s.to_i
    end

    it "sets sop_instance_uid from a hash value" do
      hash = { :ahash => 4567, :should => "work" }
      @obj.sop_instance_uid = hash
      @obj.sop_instance_uid.value.should == hash.to_s
    end

    it "sets sop_instance_uid from an array value" do
      arr = [1,2,3,4,5,"string"]
      @obj.sop_instance_uid = arr
      @obj.sop_instance_uid.value.should == arr.to_s
    end

    it "sets sop_instance_uid from a float value" do
      float = 1267.38991
      @obj.sop_instance_uid = float
      @obj.sop_instance_uid.value.should == float.to_s
    end

    it "sets sop_instance_uid from a fixnum value" do
      fixnum = 12345
      @obj.sop_instance_uid = fixnum
      @obj.sop_instance_uid.value.should == fixnum.to_s
    end

    it "sets sop_instance_uid from an object value" do
      object = Object.new
      @obj.sop_instance_uid = object
      @obj.sop_instance_uid.value.should == object.to_s
    end
=end

    it "should set sop_instance_uid from a string value" do
      string = "this is a string value"
      @obj.sop_instance_uid = string
      @obj.sop_instance_uid.value.should == string.to_s
    end

=begin
    it "sets examined_body_thickness from a hash value" do
      hash = { :ahash => 4567, :should => "work" }
      @obj.examined_body_thickness = hash
      @obj.examined_body_thickness.value.should == hash.to_s.to_f
    end

    it "sets examined_body_thickness from an array value" do
      arr = [1,2,3,4,5,"string"]
      @obj.examined_body_thickness = arr
      @obj.examined_body_thickness.value.should == arr.to_s.to_f
    end
=end

    it "should set examined_body_thickness from a float value" do
      float = 1267.38991
      @obj.examined_body_thickness = float
      @obj.examined_body_thickness.value.should == float.to_s.to_f
    end

    it "should set examined_body_thickness from an integer value" do
      integer = 12345
      @obj.examined_body_thickness = integer
      @obj.examined_body_thickness.value.should == integer.to_s.to_f
    end

=begin
    it "sets examined_body_thickness from an object value" do
      object = Object.new
      @obj.examined_body_thickness = object
      @obj.examined_body_thickness.value.should == object.to_s.to_f
    end

    it "sets examined_body_thickness from a string value" do
      string = "this is a string value"
      @obj.examined_body_thickness = string
      @obj.examined_body_thickness.value.should == string.to_s.to_f
    end
=end

    it "should create a hash with DICOM names as keys" do
      DICOM.key_use_names
      @obj.to_hash.key?("File Meta Information Group Length").should be_true
    end

    it "should create a hash with DICOM method symbols as keys" do
      DICOM.key_use_method_names
      @obj.to_hash.key?(:file_meta_information_group_length).should be_true
    end

    it "should create a hash with DICOM tags as keys" do
      DICOM.key_use_tags
      @obj.to_hash.key?("0002,0000").should be_true
    end

  end


  describe DLibrary, " (Extensions)" do

    context LIBRARY.method(:get_tag) do

      it "should return the tag corresponding to a name" do
        LIBRARY.get_tag("File Meta Information Group Length").should == "0002,0000"
      end

      it "should return nil if the tag does not exist for the given name" do
        LIBRARY.get_tag("This Name Does Not Exist Qwerty").should be_nil
      end

    end

    context LIBRARY.method(:as_method) do

      it "should return the input value as a symbol when that is a method name" do
        LIBRARY.as_method("file_meta_information_group_length").should be :file_meta_information_group_length
      end

      it "should return the method name as a symbol for strings which are names" do
        LIBRARY.as_method("File Meta Information Group Length").should be :file_meta_information_group_length
      end

      it "should return the method name as a symbol for strings which are tags" do
        LIBRARY.as_method("0002,0000").should be :file_meta_information_group_length
      end

      it "should return nil for strings which are non-existant methods" do
        LIBRARY.as_method("this_method_does_not_exist_qwerty").should be_nil
      end

      it "should return nil for strings which are names of non-existant methods" do
        LIBRARY.as_method("This Name Does Not Exist Qwerty").should be_nil
      end

      it "should return nil for strings which are tags not part of the DICOM standard" do
        LIBRARY.as_method("9999,QERT").should be_nil
      end

    end

    context LIBRARY.method(:as_tag) do

      it "should return the input value when that is a tag" do
        LIBRARY.as_tag("0002,0000").should == "0002,0000"
      end

      it "should return the tag for strings which are names" do
        LIBRARY.as_tag("File Meta Information Group Length").should == "0002,0000"
      end

      it "should return the tag for strings which are methods" do
        LIBRARY.as_tag("file_meta_information_group_length").should == "0002,0000"
      end

      it "should return nil for strings which are method names corresponding to non-existant tags" do
        LIBRARY.as_tag("this_method_does_not_exist_qwerty").should be_nil
      end

      it "should return nil for strings which are names corresponding to non-existant tags" do
        LIBRARY.as_tag("This Name Does Not Exist Qwerty").should be_nil
      end

      it "should return nil for strings which non-existant tags" do
        LIBRARY.as_tag("9999,QERT").should be_nil
      end

    end

    context LIBRARY.method(:as_name) do

      it "should return the input value when that is a name" do
        LIBRARY.as_name("File Meta Information Group Length").should == "File Meta Information Group Length"
      end

      it "should return the name for strings which are method names" do
        LIBRARY.as_name("file_meta_information_group_length").should == "File Meta Information Group Length"
      end

      it "should return the name for strings which are tags" do
        LIBRARY.as_name("0002,0000").should == "File Meta Information Group Length"
      end

      it "should return nil for strings which are method names corresponding to non-existant names" do
        LIBRARY.as_name("this_method_does_not_exist_qwerty").should be_nil
      end

      it "should return nil for strings which are non-existant names" do
        LIBRARY.as_name("This Name Does Not Exist Qwerty").should be_nil
      end

      it "should return nil for strings which are tags corresponding to non-existant names" do
        LIBRARY.as_name("9999,QERT").should be_nil
      end

    end

  end


  describe String, " (Extensions)" do

    context "".method(:dicom_methodize) do

      it "should return a method name 'three_d_stuff_and_with_some_weird_characters' for '3d Stuff & with some !? weird !!! characters'" do
        "3d Stuff & with some !? weird !!! characters".dicom_methodize.should == "three_d_stuff_and_with_some_weird_characters"
      end

      it "should return a method name 'three_d_something_its_nice' for '3d (something) it's NICE'" do
        "3d (something) it's NICE".dicom_methodize.should == "three_d_something_its_nice"
      end

      # Comment: How non-ascii characters in method names should be handled is something that may be up for debate.
      it "should return a method name with the non-ascii character preserved" do
        #"hello µValue it's STUPID".dicom_methodize.should == "hello_uvalue_its_stupid" # (alternative spec)
        "hello µValue it's STUPID".dicom_methodize.should == "hello_µvalue_its_stupid"
      end

    end

    context "".method(:dicom_name?) do

      it "should return true if the string looks like a DICOM element name" do
        "This Looks Like A Name".dicom_name?.should be_true
      end

      it "should return false if the string doesnt look like a DICOM element name" do
        "this Doesnt Look like a name".dicom_name?.should be_false
      end

      it "should return false if the string looks like a DICOM method name" do
        "this_looks_like_a_method_name".dicom_name?.should be_false
      end

    end

    context "".method(:dicom_method?) do

      it "should return true if the string looks like a DICOM method name" do
        "this_looks_like_a_method_name".dicom_method?.should be_true
      end

      it "should return false if the string doesnt look like a DICOM method name" do
        "This_doesnt look_like a MethodName".dicom_method?.should be_false
      end

      it "should return false if the string looks like a DICOM element name" do
        "This Looks Like A Name".dicom_method?.should be_false
      end

    end

  end

end