(define 

    (problem runbook_move_server_rack_to_rack_3_server)

    (:domain runbook_move_server_rack_to_rack)

    (:objects 
       x01 x02 x03 x04 x05 x06 x07 x08 x09 x10 x11 x12 x13 x14 x15 - tX

       y01 y02 y03 y04 y05 - tY
    )

    (:init 
       (i x01 x02) (i x02 x03) (i x03 x04) (i x04 x05) (i x05 x06) (i x06 x07) (i x07 x08) (i x08 x09) (i x09 x10) (i x10 x11) (i x11 x12) (i x12 x13) (i x13 x14) (i x14 x15)
       (d x15 x14) (d x14 x13) (d x13 x12) (d x12 x11) (d x11 x10) (d x10 x09) (d x09 x08) (d x08 x07) (d x07 x06) (d x06 x05) (d x05 x04) (d x04 x03) (d x03 x02) (d x02 x01)

       (i y01 y02) (i y02 y03) (i y03 y04) (i y04 y05)
       (d y05 y04) (d y04 y03) (d y03 y02) (d y02 y01)

;;DC-CMO
       (r x01 y01) 
                               (b x03 y02)             
                               (b x03 y03)
                               (b x03 y04)

       
;;DC-NET
       (w x06 y01)                                     (w x10 y01) 
       (w x06 y02) (w x07 y02) (w x08 y02) (w x09 y02) (w x10 y02)

       (w x06 y04) (w x07 y04) (w x08 y04) (w x09 y04) (w x10 y04)
       (w x06 y05)                                     (w x10 y05)
    )

    (:goal 
    (and
;;DC-FMO
       (r x11 y01)
                               (b x13 y02)            
                               (b x13 y03)
                               (b x13 y04)


    )
    )

)
