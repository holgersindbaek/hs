module HS
  class Base

    # ROTATION HELPERS
    def landscape_left?
      Device.interface_orientation == :landscape_left
    end

    def landscape_right?
      Device.interface_orientation == :landscape_right
    end

    def right_side_up?
      Device.interface_orientation == :portrait
    end

    def upside_down?
      Device.interface_orientation == :portrait_upside_down
    end

    def landscape?
      landscape_left? || landscape_right?
    end

    def portrait?
      right_side_up?
    end

    def rotation_width(orientation = Device.interface_orientation)
      Device.screen.width_for_orientation(orientation)
    end

    def rotation_height(orientation = Device.interface_orientation)
      Device.screen.height_for_orientation(orientation)
    end
    
    def rotation_transform
      transform = 0.degrees
      if landscape_left?
        transform = 270.degrees
      elsif landscape_right?
        transform = 90.degrees
      end

      CGAffineTransformMakeRotation(transform)
    end

  end
end